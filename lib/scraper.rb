require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
<<<<<<< HEAD
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
    hash = {
      twitter: social[0]['href'],
      linkedin: social[1]['href'],
      github: social[2]['href'],
      blog: social[3]['href'],
      profile_quote: doc.css('div.profile-quote').text,
      bio: doc.css('div.description-holder p').text}
=======
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

>>>>>>> f42d41ca33b267877bac928856a4727d858456ae
  end

end
