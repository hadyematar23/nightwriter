require 'spec_helper'

RSpec.describe Alphabet do
  let(:latin_alphabet){Alphabet.new(:latin)}
  let(:braille_alphabet){Alphabet.new(:braille)}

    it "exists as an alphabet" do
       expect(latin_alphabet).to be_an_instance_of(Alphabet)
       expect(braille_alphabet).to be_an_instance_of(Alphabet)

    end 

    it "is either in latin script or in braille" do 
      expect(latin_alphabet.script).to eq(:latin)
      expect(braille_alphabet.script).to eq(:braille)
    end