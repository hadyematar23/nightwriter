require_relative './braille_letter'
require_relative './dictionary'
require_relative './latin_letter'
require_relative './latin_to_braille_translate'

class LatinToBraille

  def initialize(files)
    message_file = File.open(files[0], "r")
    phrase = message_file.read
    @dictionary = Dictionary.new
    translated_phrase = translate_phrase(phrase)
    print_to_txt_file(translated_phrase, files[1])
    print_to_console(message_file, files[1])

  end

  def print_to_txt_file(translated_phrase, file)
    new_file = File.new(file, "w")
    new_file.puts translated_phrase
    new_file.close
  end 

  def print_to_console(file, file_name)
    length = count(file)
    print(length, file_name)
  end 

  def count(file)

      lines = File.readlines(file)
      joined_lines = lines.join
      joined_lines.delete!"\n"
      joined_lines.length

  end
  
  def print(length, file_name) 
    p "Created #{file_name} containing #{length} characters"
  end

  def translate_phrase(phrase)
    non_transposed = translate_l_to_braille(phrase)
    transposed = print_phrase(non_transposed)
    cut = cut_to_eighty(transposed)
    blank_added = add_blank_space(cut)
  end 

  def read_file  
    File.read(@file)
  end 

  def translate_l_to_braille(phrase)
    translated_array = []

    latin_phrase = phrase.split('')
    latin_phrase.each do |latin_letter|
      @dictionary.braille_script.each do |braille_letter|
        if latin_letter == braille_letter.latin_equivalent
          translated_array << braille_letter.representation
        end
    end
  end 
  translated_array 
  end

  def print_phrase(braille_array)
    array = []
      braille_array.map do |brailee|
        array << brailee.split("!")
      end 
      array = array.transpose

      array.map! do |element|
      element.join
      end
      array
  end

  def cut_to_eighty(transposed)
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

  def add_blank_space(array)
    new_ish = array.flat_map do |individual_array| 
      [individual_array, [" "]]
    end
    new_ish = new_ish[0..-2]
  end


end