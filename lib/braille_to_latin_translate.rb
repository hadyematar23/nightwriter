require_relative './braille_letter'
require_relative './dictionary'
require_relative './latin_letter'
require_relative './printable_module'
require_relative './translate'

class BrailleToLatin < Translate
  include Printable
            
  def initialize(files)
    super
  end

  def translate_and_print(files) 
    translated_phrase = translate_phrase(@message_file.read)
    print_to_txt_file(translated_phrase, files[1])
    print_to_console(files[1])
  end

  def translate_phrase(braille_input_from_file) 
    split_lines = split_lines(braille_input_from_file)
    representations = create_representations(split_lines)
    converted_phrase = iterate_to_latin(representations)
  end

  def modify_script 
    array = []
    @dictionary.braille_script.each do |braille_letter|
      braille_letter.representation.delete! "!"
      array << braille_letter 
    end 
    array
  end

  def split_lines(phrase) 
    split = phrase.split("\n")
  end

  def create_representations(already_split) 
  
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

  def translate_method(already_split) 
    empty_hash = Hash.new{ |hash, key| hash[key] = [] }
    already_split.each do |element|
      i = 0 
      while element.chars.length > 0 do   
        i = i + 1
      empty_hash[i] << element[0..1]
      element = element[2..-1]
      end
    end 
    a = empty_hash.values.map {|array| array.join}
  end

  def iterate_to_latin(representations)
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