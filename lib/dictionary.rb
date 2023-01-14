class Dictionary
          attr_reader :latin_script, 
                      :braille_script
  def initialize
    @latin_script = []
    create_latin_letters
    @braille_script = []
  end

  def create_latin_letters
    ("a".."z").each {|letter| @latin_script << LatinLetter.new(letter)} 
    @latin_script << LatinLetter.new("space")
  end


end