require 'net/http'
require 'open-uri'
require 'json'
 
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  #make get request
  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  #define a method to return organizations that run the after-school programs
  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

# programs = GetPrograms.new.get_programs
# puts programs

#print out the unique schools
programs = GetPrograms.new
puts programs.program_school.uniq
