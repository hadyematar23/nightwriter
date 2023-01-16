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
    translation2 = BrailleToLatin.new(braille_phrase, files[1])
  end
end 