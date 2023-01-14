require 'spec_helper'

RSpec.describe Dictionary do
let(:dictionary){Dictionary.new}
let(:a_braille){BrailleLetter.new("a","0.!..!..")}
let(:b_braille){BrailleLetter.new("b","0.!0.!..")}
let(:c_braille){BrailleLetter.new("c","00!..!..")}
let(:space_braille){BrailleLetter.new("space", "..!..!..")}

  it "exists as an object" do 
    expect(dictionary).to be_an_instance_of(Dictionary)
  end 

  it "houses an array with all of the letters of Latin script" do 
    expect(dictionary.latin_script).to be_an_instance_of(Array)
  end

  it "upon initialization, the dictionary creates all of the latin letter objects and a blank space(as in between words) in the array" do 
    expect(dictionary.latin_script).to all(be_a(LatinLetter))
    expect(dictionary.latin_script.count).to eq(27)
  end

  it "upon initialize, the dictionary creates all of the braille letter objects and a blank space(as in between words) in the array" do 
    expect(dictionary.braille_script).to all(be_a(BrailleLetter))
    expect(dictionary.braille_script.count).to eq(27)
  end
# FOR LATER- TRANSLATING BRAILLE TO ENGLISH 
  # it "has a place to store the braille letteres" do 
  #   expect(dictionary.braille_phrase).to eq([])
  # end

  # it "can add the braille phrases in an ordered fashion to the letters array" do 
  #   dictionary.add_braille_letter_to_braille_phrase(a_braille)
  #   dictionary.add_braille_letter_to_braille_phrase(b_braille)
  #   dictionary.add_braille_letter_to_braille_phrase(c_braille)
  #   dictionary.add_braille_letter_to_braille_phrase(space_braille)
  #   dictionary.add_braille_letter_to_braille_phrase(a_braille)
  
  #   expect(dictionary.braille_phrase).to eq(["0.!..!..", "0.!0.!..", "00!..!..", "..!..!..", "0.!..!.."])
  # end

  it "when input of a Latin letter is provided it will return the braille equivalent" do 
    input = "a"
    expect(dictionary.translate_l_to_braille(input)).to eq(["0.!..!.."])
  end

  it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
    input = "hello w"
    expect(dictionary.translate_l_to_braille(input)).to eq(["0.!00!..", "0.!.0!..", "0.!0.!0.", "0.!0.!0.", "0.!.0!0.", "..!..!..", ".0!00!.0"])

  end

  it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
    input = "a lazy fox"
    expect(dictionary.translate_l_to_braille(input)).to eq(["0.!..!..", "..!..!..", "0.!0.!0.", "0.!..!..", "0.!.0!00", "00!.0!00", "..!..!..", "00!0.!..", "0.!.0!0.", "00!..!00"])

  end

  context "printing the braille array to the console" do 
    it "the first element of the print_phrase array represents the first uppermost row of the braille character" do 
      braille_array = ["0.!..!.."]   
      expect(dictionary.print_phrase(braille_array)[0]).to eq("0.")
    end 

    it "the second element of the print_phrase array represents the middle row of the braille character" do 
      braille_array = ["0.!..!.."]
    
      expect(dictionary.print_phrase(braille_array)[1]).to eq("..")
    end 

    it "the third and final element of the print_phrase array represents the bottom row of the braille character" do 
      braille_array = ["0.!..!.."]
    
      expect(dictionary.print_phrase(braille_array)[2]).to eq("..")
    end 

    it "when you want to print two letters together, the first element of the print_phrase array will include the uppermost rows of both braille characters respectively" do 
      braille_array = ["0.!..!..", "0.!0.!.."]

      expect(dictionary.print_phrase(braille_array)[0]).to eq("0.0.")
      expect(dictionary.print_phrase(braille_array)[1]).to eq("..0.")
      expect(dictionary.print_phrase(braille_array)[2]).to eq("....")
      
    end
  end 

  context "#integration test of inputting latin phrase and getting braille print to console" do 
    it "takes in a latin phrase and outputs the braille equivalent to the console" do 
      phrase = "he w"
      expect(dictionary.latin_to_braille_helper(phrase)).to eq(["0.0....0", "00.0..00", ".......0"])
    end










  end


end 
    
