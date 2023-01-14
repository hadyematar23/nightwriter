require 'spec_helper'

RSpec.describe Dictionary do
let(:dictionary){Dictionary.new}

  it "exists as an object" do 
    expect(dictionary).to be_an_instance_of(Dictionary)
  end 

  it "houses an array with all of the letters of Latin script and Braille" do 
    expect(dictionary.latin_script).to be_an_instance_of(Array)
    expect(dictionary.braille_script).to be_an_instance_of(Array)
  end

  it "upon initialization, the dictionary creates all of the latin letter objects and a blank space(as in between words) in the array" do 
    expect(dictionary.latin_script).to all(be_a(LatinLetter))
    expect(dictionary.latin_script.count).to eq(27)
  end


end 
    
