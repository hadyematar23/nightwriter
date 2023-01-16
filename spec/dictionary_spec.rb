require 'spec_helper'

RSpec.describe Dictionary do
let(:dictionary){Dictionary.new}

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
end 
    
