# require_relative './braille_letter'
# require_relative './dictionary'
# require_relative './latin_letter'
# require_relative './latin_to_braille_translate'

# class NightWriterClass
#         attr_accessor :message_file, 
#                       :new_file, 
#                       :phrase
#   def initialize(files)
#     @files = files 
#     @message_file = File.open(files[0], "r")
#     @phrase = @message_file.read
#     phrase = @phrase
#     @new_file = File.new(files[1], "w")
#     @new_file.close
#     new_file = @new_file
#     translation1 = LatinToBraille.new(phrase, new_file)
#     length = count
#     print(length)
#   end

  # def count
  #   lines = File.readlines(@message_file)
  #   joined_lines = lines.join
  #   joined_lines.delete!"\n"
  #   joined_lines.length
  # end

  # def print(length) 
  #   p "Created #{@files[1]} containing #{length} characters"
  # end

end 