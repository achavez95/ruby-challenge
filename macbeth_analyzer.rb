#Macbeth_Analyzer
#Counts the lines each character says in the play

#Made by Andrés Alvarez

require 'nokogiri'
require 'open-uri'

#Opening the XML file from URL
doc = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))
#Creating new Hash with values on 0 to count lines of each character
hash = Hash.new(0)

#First find all speeches
doc.xpath("//SPEECH").each do |speech|
  #Array to save all speakers in a speech
  arrayspeaker = Array.new
  #Then find all speakers
  speech.xpath('SPEAKER').each do |speaker|
    #Save speaker in array
    arrayspeaker.push(speaker.text)
  end
  #Find all lines
  speech.xpath('LINE').each do |line|
    #Add a line to all the characters in that speech
    arrayspeaker.each do |character|
      hash[character] += 1
    end
  end
end

#Sort hash from more lines to less lines
hash = hash.sort_by{|k,v| v}.reverse

#Print the results
hash.each do |person, lines|
  puts "#{lines} #{person}"
end
