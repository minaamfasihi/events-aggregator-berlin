class ScrapingService
  require 'open-uri'
  require 'nokogiri'
  require 'sidekiq-scheduler'
  include Sidekiq::Worker

  def perform(*args)
    web_sources = WebSource.all
    
    web_sources.each do |source|
      begin
        web_page = Nokogiri::HTML(open(source.url))
        scrape_co_berlin(web_page, source) if source.title == "Co_Berlin"
        scrape_berghain(web_page, source) if source.title == "Berghain"
      rescue StandardError => e
        p("Some error occurred, skipping: #{e.inspect}")
      end
    end
  end

  def scrape_co_berlin(web_page, source)
    events = web_page.css('.seite-c-single')
    events.each do |event|
      begin
        event_content = event.css('.calender-text')
        event_url = [source.url, event_content&.css('a')&.attribute('href')&.value].join()
        image_url = event.css('.calender-image')&.css('img')&.css('img')&.attribute('src')&.value
        event_category = event_content&.css('.article-category')&.text
        event_start_date = event_content&.css('.date-display-start')[0]&.text
        
        unless event_start_date.present?
          event_start_date = event_content&.css('.date-display-single')[0]&.text
        end

        event_end_date = event_content&.css('.date-display-end')[0]&.text
        event_title = event_content&.css('.article-title')&.text
        event_subtitle = event_content&.css('.article-subtitle')&.text
        event_details = event_content&.css('.article-text')&.text

        source.events.find_or_create_by(
          title: event_title.to_s, 
          details: event_details.to_s, 
          event_start_date: event_start_date ? 
                              Date.strptime(event_start_date, '%d/%m/%y') : 
                              nil,
          event_end_date: event_end_date ? 
                              Date.strptime(event_end_date, '%d/%m/%y') : 
                              nil,
          event_url: event_url.to_s,
          img_url: image_url.to_s,
          category: event_category.to_s,
          subtitle: event_subtitle.to_s
        )
      rescue StandardError => e
        p("Something went wrong, #{e.inspect}")
      end
    end
  end

  def scrape_berghain(web_page, source)
    events = web_page.css('.marker')

    events.each do |event|
      begin
        event_url = [source.url, event&.css('a')&.attribute('href')&.value].join()
        event_date_container = event&.css('a')&.attribute('title')&.value&.split(':')
        event_date = event_date_container[0] if event_date_container.present?
        event_title = event&.css('a')&.css('span')&.text
        event_category = event&.css('.type_stage_color')&.css('span')&.css('b')&.text
        event_details = event&.css('.type_stage_color')&.css('span')&.text&.slice! event_category

        source.events.find_or_create_by(
          title: event_title.to_s,
          details: event_details.to_s,
          event_start_date: event_date ? 
                            Date.parse(event_date) 
                            : 
                            nil,
          event_url: event_url.to_s,
          category: event_category.to_s
        )
      rescue StandardError => e
        p("Something went wrong, #{e.inspect}")
      end
    end
  end
end
