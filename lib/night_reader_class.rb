require_relative './braille_letter'
require_relative './dictionary'
require_relative './latin_letter'
require_relative './braille_to_latin_translate'

class NightReaderClass
        attr_accessor :braille_file, 
                      :original_message_file, 
                      :braille_phrase
                      
  def initialize(files)
    @files = files 
    @braille_file = File.open(files[0], "r")
    @braille_phrase = @braille_file.read
    braille_phrase = @braille_phrase 
    @original_message_file = File.new(files[1], "w")
    @original_message_file.close
    original_message_file = @original_message_file
    translation2 = BrailleToLatin.new(braille_phrase, original_message_file)
    length = count
    print(length)
  end
# POSSIBLY MOVE THIS TO THE TRANSLATE CLASS 
  def count
    lines = File.readlines(@original_message_file)
    joined_lines = lines.join
    joined_lines.delete!"\n"
    joined_lines.length
  end

  def print(length) 
    p "Created #{@files[1]} containing #{length} characters"
  end

end 