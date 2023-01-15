class LatinToBraille

  def initialize(phrase, file_to_be_written_into)
    @dictionary = Dictionary.new
    non_transposed = translate_l_to_braille(phrase)
    @transposed = print_phrase(non_transposed)
    transposed = @transposed 
    @cut = cut_to_eighty(transposed)
    cut = @cut
    @blank_added = add_blank_space(cut)
    @file = File.open(file_to_be_written_into, "w")
    @file.puts @blank_added
    @file.close
    
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