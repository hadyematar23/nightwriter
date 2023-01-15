class Dictionary
          attr_reader :latin_script, 
                      :braille_script,
                       :braille_array,
                       :read_file,
                       :transposed,
                       :cut, 
                       :blank_added, 
                      :braille_phrase
  def initialize
    @braille_array = nil 
    @latin_script = []
    create_latin_letters
    @braille_script = nil
    create_braille_characters
    # non_transposed = latin_to_braille_helper(phrase)
    # @transposed = print_phrase(non_transposed)
    # transposed = @transposed 
    # @cut = cut_to_eighty(transposed)
    # cut = @cut
    # @blank_added = add_blank_space(cut)
    # file = File.open(file, "w")
    # file.puts @blank_added
    # file.close
    # @read_file = File.read(file)
  end

  def create_latin_letters
    ("a".."z").each {|letter| @latin_script << LatinLetter.new(letter)} 
    @latin_script << LatinLetter.new("space")
  end

  def create_braille_characters
    @braille_script = [
    BrailleLetter.new("a", "0.!..!.."),
    BrailleLetter.new("b", "0.!0.!.."),
    BrailleLetter.new("c", "00!..!.."),
    BrailleLetter.new("d", "00!.0!.."),
    BrailleLetter.new("e", "0.!.0!.."),
    BrailleLetter.new("f", "00!0.!.."),
    BrailleLetter.new("g", "00!00!.."),
    BrailleLetter.new("h", "0.!00!.."),
    BrailleLetter.new("i", ".0!0.!.."),
    BrailleLetter.new("j", ".0!00!.."),
    BrailleLetter.new("k", "0.!..!0."),
    BrailleLetter.new("l", "0.!0.!0."),
    BrailleLetter.new("m", "00!..!0."),
    BrailleLetter.new("n", "00!.0!0."),
    BrailleLetter.new("o", "0.!.0!0."),
    BrailleLetter.new("p", "00!0.!0."),
    BrailleLetter.new("q", "00!00!0."),
    BrailleLetter.new("r", "0.!00!0."),
    BrailleLetter.new("s", ".0!0.!0."),
    BrailleLetter.new("t", ".0!00!0."),
    BrailleLetter.new("u", "0.!..!00"),
    BrailleLetter.new("v", "0.!0.!00"),
    BrailleLetter.new("w", ".0!00!.0"),
    BrailleLetter.new("x", "00!..!00"),
    BrailleLetter.new("y", "00!.0!00"),
    BrailleLetter.new("z", "0.!.0!00"),
    BrailleLetter.new(" ", "..!..!..")]
  end

  # def add_braille_letter_to_braille_phrase(braille_letter)
  #   @braille_phrase << braille_letter.representation
  # end

  # def latin_to_braille_helper(phrase)
  #   @braille_array = translate_l_to_braille(phrase)
  #   @braille_array
  # end 

  # def translate_l_to_braille(phrase)
  #   translated_array = []

  #   latin_phrase = phrase.split('')
  #   latin_phrase.each do |latin_letter|
  #     @braille_script.each do |braille_letter|
  #       if latin_letter == braille_letter.latin_equivalent
  #         translated_array << braille_letter.representation
  #       end
  #   end
  # end 
  # translated_array
  # end

  # def print_phrase(braille_array)
  #   array = []
  #     braille_array.map do |brailee|
  #       array << brailee.split("!")
  #     end 
  #     array = array.transpose

  #     array.map! do |element|
  #     element.join
  #     end
  #     array
  # end

  # def cut_to_eighty(transposed)
  #   empty_hash = Hash.new{ |hash, key| hash[key] = [] }
  #   transposed.each do |element|
  #     i = 0
  #     while element.chars.length > 80 do 
  #       i = i += 1
  #       empty_hash[i] << element[0..79]
  #       element.slice!(0..79)
  #     end
  #     if element.chars.length < 80
  #       i = i += 1
  #       empty_hash[i] << element[0..-1]
  #     end 
  #   end
  #   empty_hash.values
  # end 

  # def add_blank_space(array)
  #   new_ish = array.flat_map do |individual_array| 
  #     [individual_array, [" "]]
  #   end
  #   new_ish = new_ish[0..-2]
  # end


end