require_relative './braille_letter'
require_relative './dictionary'
require_relative './latin_letter'

class BrailleToLatin
            
  def initialize(files)
    @dictionary = Dictionary.new
    @message_file = File.open(files[0], "r")
    translate_and_print(files)
  end

  def translate_and_print(files) #HELPER METHOD THAT COMBINES EVERYTHING
    translated_phrase = translate_phrase(@message_file.read)
    print_to_txt_file(translated_phrase, files[1])
    print_to_console(files[1])
  end

  def print_to_txt_file(translated_phrase, file) #tested
    new_file = File.new(file, "w")
    new_file.puts translated_phrase
    new_file.close
  end 

  def print_to_console(file) #tested
    length = count(file)
    print(length, file)
  end 

  def print(length, file_name) #tested
    p "Created #{file_name} containing #{length} characters"
  end

  def count(file) #test
    lines = File.readlines(file)
    joined_lines = lines.join
    joined_lines.delete!"\n"
    joined_lines.length
  end

  def translate_phrase(phrase) #teste
    split_lines = split_lines(phrase)
    representations = create_representations(split_lines)
    converted_phrase = iterate_to_latin(representations)
  end

  def modify_script #tested
    array = []
    @dictionary.braille_script.each do |braille_letter|
      braille_letter.representation.delete! "!"
      array << braille_letter 
    end 
    array
  end

  def split_lines(phrase) #tested
    split = phrase.split("\n")
  end

  def create_representations(already_split) #tested
  
    if already_split.count == 3
      translate_method(already_split)
      
    elsif already_split.count >3 
      phrase = []
      already_split = already_split - [" "]
      already_split = already_split.each_slice(3).to_a
      already_split.each do |one_line_array|
        phrase << translate_method(one_line_array)
      end
      return phrase.flatten
    end
  end

  def translate_method(argument) #tested
    empty_hash = Hash.new{ |hash, key| hash[key] = [] }
    argument.each do |element|
      i = 0 
      while element.chars.length > 0 do   
        i = i + 1
      empty_hash[i] << element[0..1]
      element = element[2..-1]
      end
    end 
    a = empty_hash.values.map {|array| array.join}
  end

  def iterate_to_latin(representations)#tested
    latin_letter_array = []
    representations.each do |representation| 
      modify_script.each do |braille_letter_object|
        if representation == braille_letter_object.representation
          latin_letter_array << braille_letter_object.latin_equivalent
        end
      end
    end
    return latin_letter_array.join 
  end

end