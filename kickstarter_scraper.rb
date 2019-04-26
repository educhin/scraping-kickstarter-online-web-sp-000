# require libraries/modules here
require 'nokogiri'
require 'pry'

#project: kickstarter.css(".project-card")
#title: project.css("h2.bbcard_name strong a").text
#pic: project.css("div.project-thumbnail a img").attribute("src").value
#description project.css("p.bbcard_blurb").text
#location project.css("ul.project-meta li a span.location-name").text
#precent funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i



def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css(".project-card").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {}
  end
  projects
end

create_project_hash
