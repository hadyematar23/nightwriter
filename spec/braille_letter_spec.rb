require 'spec_helper'

RSpec.describe BrailleLetter do
let(:a_braille){BrailleLetter.new("a","0.\n..\n..")}
let(:b_braille){BrailleLetter.new("b","0.\n0.\n..")}
let(:c_braille){BrailleLetter.new("c","00\n..\n..")}
let(:space_braille){BrailleLetter.new("space", "..\n..\n..")}

  it "exists as a braille letter" do 
    expect(a_braille).to be_an_instance_of(BrailleLetter)
  end

  it "has attributes including a Latin equivalent and a series of dots that is the braille representation on computer screens" do 
    expect(a_braille.latin_equivalent).to eq("a")
    expect(a_braille.representation).to eq("0.\n..\n..")
    expect(b_braille.representation).to eq("0.\n0.\n..")
    expect(c_braille.representation).to eq("00\n..\n..")
    expect(space_braille.representation).to eq("..\n..\n..")
  end

end 