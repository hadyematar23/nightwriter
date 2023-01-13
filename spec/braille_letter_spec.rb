require 'spec_helper'

RSpec.describe BrailleLetter do
let(:a_braille){BrailleLetter.new("a",{
                  row1: ["0","."], 
                  row2: [".","."], 
                  row3: [".","."]})}

  it "exists as a braille letter" do 
    expect(a_braille).to be_an_instance_of(BrailleLetter)
  end

  it "has attributes including a Latin equivalent and a series of dots that is the braille representation on computer screens" do 
    expect(a_braille.latin_equivalent).to eq("a")
    expect(a_braille.representation).to eq({
      row1: ["0","."], 
      row2: [".","."], 
      row3: [".","."]
      })
  end

  it "the braille representation prints as a series of two three lines with two rows" do 
    expect(a.print).to eq("0.", 
                          "..", 
                          "..")

  end
end 