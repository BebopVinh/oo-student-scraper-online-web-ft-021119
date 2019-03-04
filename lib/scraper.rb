require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = doc.css('div.student-card')
    array = []
    students.each do |student|
      array << {
      name: student.css('h4.student-name').text,
      location: student.css('p.student-location').text,
      profile_url: student.css('a').first['href'] }
    end
    array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    social = doc.css('div.social-icon-container a')
    hash = {}
    social.each do |link|
      x = link['href']
      if x.include?('twitter')
        hash[:twitter] = x
      elsif x.include?('linkedin')
        hash[:linkedin] = x
      elsif x.include?('github')
        hash[:github] = x
      elsif x != '#'
        hash[:blog] = x
      end
    end
    hash[:profile_quote] = doc.css('div.profile-quote').text
    hash[:bio] = doc.css('div.description-holder p').text
    hash
  end #End of .scrape_profile_page
end #End of Class
