require 'uri'
require 'net/http'
require 'nokogiri'


j = ActiveSupport::JSON


desc 'Get course info from timetable'
task :get_course_info do

  # res = Net::HTTP.post_form(URI.parse('http://oracle-www.dartmouth.edu/dart/groucho/timetable.display_courses'),
  #                                 {'crnl' => 'no_value', 'distribradio' => 'alldistribs', 'depts' => 'no_value', 'periods' => 'no_value', 'distribs' => 'no_value', 'distribs_i' => 'no_value', 'distribs_wc' => 'no_value', 'pmode' => 'public', 'term' => '', 'levl' => '', 'fys' => 'n', 'wrt' => 'n', 'pe' => 'n', 'review' => 'n', 'classyear' => '2008', 'searchtype' => 'Subject+Area%28s%29', 'termradio' => 'selectterms', 'terms' => 'no_value', 'terms' => '201103', 'subjectradio' => 'allsubjects', 'hoursradio' => 'allhours', 'sortorder' => 'dept'})


  # response = Typhoeus::Request.post('http://oracle-www.dartmouth.edu/dart/groucho/timetable.display_courses',
  #               :params => {'crnl' => 'no_value', 'distribradio' => 'alldistribs', 'depts' => 'no_value', 'periods' => 'no_value', 'distribs' => 'no_value', 'distribs_i' => 'no_value', 'distribs_wc' => 'no_value', 'pmode' => 'public', 'term' => '', 'levl' => '', 'fys' => 'n', 'wrt' => 'n', 'pe' => 'n', 'review' => 'n', 'classyear' => '2008', 'searchtype' => 'Subject+Area%28s%29', 'termradio' => 'selectterms', 'terms' => 'no_value', 'terms' => '201103', 'subjectradio' => 'allsubjects', 'hoursradio' => 'allhours', 'sortorder' => 'dept'})
  #               
  # puts response.body


  # puts e

  # puts res.body

  # fork do
  #   curl = 'curl --data "crnl=no_value&distribradio=alldistribs&depts=no_value&periods=no_value&distribs=no_value&distribs_i=no_value&distribs_wc=no_value&pmode=public&term=&levl=&fys=n&wrt=n&pe=n&review=n&classyear=2008&searchtype=Subject+Area%28s%29&termradio=selectterms&terms=no_value&terms=201103&subjectradio=allsubjects&hoursradio=allhours&sortorder=dept" http://oracle-www.dartmouth.edu/dart/groucho/timetable.display_courses'
  #   exec "#{curl} > lib/tasks/html.txt"
  # end
  # Process.wait

  doc = File.open('lib/tasks/html.txt', 'r').read
  output = File.open('lib/tasks/output.txt', 'w')
  html = Nokogiri::HTML(doc)

  # puts html.css('.data_table').inspect
  output.puts html.css('.data-table table').inspect
  
  courses = [{:crn => 234, :title => 'Spanish 1', :enrollment => 30, :limit => 35},
             {:crn => 546, :title => 'French 1', :enrollment => 15, :limit => 15}]

  puts j.encode(courses)
end
