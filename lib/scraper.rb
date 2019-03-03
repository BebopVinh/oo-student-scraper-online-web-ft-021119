require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = doc.css('div.student-card')
    students.each do |student|
      name = student.css('h4.student-name').text
      location = student.css('p.student-location').text
      profile = student.css('a')
      binding.pry
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
