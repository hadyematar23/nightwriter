require_relative './braille_letter'
require_relative './dictionary'
require_relative './latin_letter'
require_relative './printable_module'
require_relative './translate'

class LatinToBraille < Translate
  include Printable

  def initialize(files)
    @dictionary = Dictionary.new
    @message_file = File.open(files[0], "r")
    translate_and_print(files)
  end

  def translate_and_print(files) #not tested
    translated_phrase = translate_phrase(@message_file.read)
    print_to_txt_file(translated_phrase, files[1])
    print_to_console(@message_file, files[1])
  end 
  
  def print_to_console(file, file_name)#TESTED
    length = count(file)
    print(length, file_name)
  end 
  
  def print(length, file_name) #tested
    p "Created #{file_name} containing #{length} characters"
  end

  def translate_phrase(phrase_to_translate) #tested
    non_transposed = translate_l_to_braille(phrase_to_translate)
    transposed = transpose_phrase(non_transposed)
    cut = cut_to_eighty(transposed)
    blank_added = add_blank_space(cut)
  end 

  def translate_l_to_braille(phrase_to_translate) #TESTED
    translated_array = []
    latin_phrase = phrase_to_translate.split('')
    latin_phrase.each do |latin_letter|
      @dictionary.braille_script.each do |braille_letter|
        if latin_letter == braille_letter.latin_equivalent
          translated_array << braille_letter.representation
        end
    end
  end 
  translated_array 
  end

  def transpose_phrase(braille_array) #tested
      array = []
      braille_array.map {|brailee| array << brailee.split("!") }
      array = array.transpose
      array.map! {|element| element.join}
  end

  def cut_to_eighty(transposed) #TESTED
    empty_hash = Hash.new{ |hash, key| hash[key] = [] }
    transposed.each do |element|
      i = 0
      while element.chars.length > 80 do 
        i = i += 1
        empty_hash[i] << element[0..79]
        element.slice!(0..79)
      end
      if element.chars.length < 80
        i = i += 1
        empty_hash[i] << element[0..-1]
      end 
    end
    empty_hash.values
  end 

  def add_blank_space(array) #TESTED
    new_ish = array.flat_map {|individual_array| [individual_array, [" "]]}
    new_ish = new_ish[0..-2]
  end
end