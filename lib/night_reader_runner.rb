require_relative './braille_letter'
require_relative './dictionary'
require_relative './latin_letter'

class NightReaderRunner
        attr_accessor :message_file, 
                      :new_file, 
                      :phrase
  def initialize(files)
    @files = files 
    @message_file = File.open(files[0], "r")
    @phrase = @message_file.read
    phrase = @phrase
    @new_file = File.new(files[1], "w")
    @new_file.close
    new_file = @new_file
    dictionary= Dictionary.new(phrase, new_file)
  end

  def run 
    characters = count_number
    string = create_string(characters)
  end

  def count_number  
    lines = File.readlines(@message_file)
    joined_lines = lines.join
    joined_lines.delete!"\n"
    length = joined_lines.length
  end 
  
  def create_string(characters)
    p "Created #{@files[1]} containing #{characters} characters"
  end 

if $PROGRAM_NAME == __FILE__ 
  require 'pry'; binding.pry
  NightWriterRunner.new(ARGV).run
end 

end