class BrailleToLatin
            
  def initialize(braille_phrase, file_to_be_written_to)
    @dictionary = Dictionary.new
  end

  def modify_script
    array = []
    @dictionary.braille_script.each do |braille_letter|
      braille_letter.representation.delete! "!"
      array << braille_letter 
    end 
    array
  end

  def translate_braille_to_l(braille_phrase)
    representations = create_representations(braille_phrase)
    converted_phrase = iterate_to_latin(representations)
  end

  def create_representations(braille_phrase)
    split = braille_phrase.split("\n")

    if split.count == 3
      empty_hash = Hash.new{ |hash, key| hash[key] = [] }
      split.each do |element|
        i = 0 
        while element.chars.length > 0 do   
          i = i + 1
        empty_hash[i] << element[0..1]
        element = element[2..-1]
        end
      end 
      return empty_hash.values.map {|array| array.join}

    elsif split.count >3 
      phrase = []
      empty_hash = Hash.new{ |hash, key| hash[key] = [] }
      split = split - [" "]
      split = split.each_slice(3).to_a

      split.each do |one_line_array|
          one_line_array.each do |element|
            i = 0 
          while element.chars.length > 0 do   
            i = i + 1
            empty_hash[i] << element[0..1]
            element = element[2..-1]
          end
        end 
       phrase << empty_hash.values.map {|array| array.join}
       phrase = phrase.flatten
       empty_hash = Hash.new{ |hash, key| hash[key] = [] }
      end
      return phrase
    end

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