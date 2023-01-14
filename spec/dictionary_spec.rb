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

  xit "when input of a Latin letter is provided it will return the braille equivalent" do 
    input = "a"
    expect(dictionary.translate_l_to_braille(input)).to eq([["0.!..!.."]])
  end

  it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
    input = "hello w"
    expect(dictionary.translate_l_to_braille(input)).to eq([["0.!00!.."], ["0.!.0!.."], ["0.!0.!0."], ["0.!0.!0."], ["0.!.0!0."], ["..!..!.."], [".0!00!.0"]])

  end

  it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
    input = "a lazy fox"
    expect(dictionary.translate_l_to_braille(input)).to eq([["0.!..!.."], ["..!..!.."], ["0.!0.!0."], ["0.!..!.."], ["0.!.0!00"], ["00!.0!00"], ["..!..!.."], ["00!0.!.."], ["0.!.0!0."], ["00!..!00"]])

  end


end 
    
