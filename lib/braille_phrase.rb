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
        array << brailee.split
      end 
      
      array = array.transpose
      
      array.map! do |element|
      element.join
      end
      puts array 
      array
  end
end