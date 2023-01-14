class Dictionary
          attr_reader :latin_script, 
                      :braille_script, 
                      :braille_phrase
  def initialize
    @latin_script = []
    create_latin_letters
    @braille_script = nil
    create_braille_characters
    # @braille_phrase = []
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

  def latin_to_braille_helper(phrase)
    braille_array = translate_l_to_braille(phrase)
    print_phrase(braille_array)
  end 


  def translate_l_to_braille(phrase)
    translated_array = []

    latin_phrase = phrase.split('')
    latin_phrase.each do |latin_letter|
      @braille_script.each do |braille_letter|
        if latin_letter == braille_letter.latin_equivalent
          translated_array << braille_letter.representation
        end
    end
    
  end 
  # require 'pry'; binding.pry
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
      puts array 
      array
  end
end