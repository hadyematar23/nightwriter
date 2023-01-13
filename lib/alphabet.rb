class Alphabet
        attr_reader :script, 
                    :latin_alphabet
  def initialize(script)
    @script = script
    @latin_alphabet = []
    @braille_alphabet = []
  end

  def generate_latin
    ("a".."z").each do |letter| 
      @latin_alphabet << LatinLetter.new(letter)
    end 
  end

end