require 'spec_helper'

RSpec.describe Alphabet do
  let(:latin_alphabet){Alphabet.new(:latin)}
  let(:braille_alphabet){Alphabet.new(:braille)}

    xit "exists as an alphabet" do
       expect(latin_alphabet).to be_an_instance_of(Alphabet)
       expect(braille_alphabet).to be_an_instance_of(Alphabet)

    end 

    xit "is either in latin script or in braille" do 
      expect(latin_alphabet.script).to eq(:latin)
      expect(braille_alphabet.script).to eq(:braille)
    end

    xit "houses the potential for a latin alphabet" do 
      expect(latin_alphabet.latin_alphabet).to eq([])
    end

    it "can iterate over to create a latin alphabet" do 
      latin_alphabet.generate_latin
      expect(latin_alphabet.latin_alphabet).to be_an_instance_of(Array)
      expect(latin_alphabet.latin_alphabet[0..26]).to all(be_an_instance_of(LatinLetter))
    end


  end 