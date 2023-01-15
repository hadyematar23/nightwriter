require_relative './braille_letter'
require_relative './dictionary'
require_relative './latin_letter'

class NightReaderClass
        attr_accessor :message_file, 
                      :new_file, 
                      :phrase
  def initialize(files)
    require 'pry'; binding.pry
    @files = files 
    @braille_file = File.open(files[0], "r")
    @phrase = @message_file.read
    phrase = @phrase
    @original_message_file = File.new(files[1], "w")
    @original_message_file.close
    original_message_file = @original_message_file
    dictionary= Dictionary.new(phrase, original_message_file)
    length = count
    print(length)
  end

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