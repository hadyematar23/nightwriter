class BraillePhrase
          attr_reader :letters
  def initialize
     @letters = [] 
  end

  def add_letter(braille_letter)
    @letters << braille_letter.representation
  end

  def print_phrase
    array = []
      @letters.map do |brailee|
        array << brailee.split("!")
      end 
      require 'pry'; binding.pry
      array = array.transpose

      array.map! do |element|
      element.join
      end
      require 'pry'; binding.pry
      puts array 
      array
  end
end