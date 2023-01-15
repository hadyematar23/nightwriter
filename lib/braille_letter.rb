class BrailleLetter
          attr_reader :latin_equivalent, 
                      :representation
                      
  def initialize(latin_equivalent, representation)
    @latin_equivalent = latin_equivalent
    @representation = representation
  end
end