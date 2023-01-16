class Dictionary
          attr_reader :latin_script, 
                      :braille_script,
                       :braille_array
                                      
  def initialize
    @braille_array = nil 
    @latin_script = []
    create_latin_letters
    @braille_script = nil
    create_braille_characters
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
end