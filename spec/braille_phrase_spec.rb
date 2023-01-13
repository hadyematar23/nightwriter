require 'spec_helper'

RSpec.describe BraillePhrase do
let(:a_braille){BrailleLetter.new("a","0.\n..\n..")}
let(:b_braille){BrailleLetter.new("b","0.\n0.\n..")}
let(:c_braille){BrailleLetter.new("c","00\n..\n..")}
let(:abc_phrase){BraillePhrase.new}
let(:space_braille){BrailleLetter.new("space", "..\n..\n..")}

it "exists as a braille phrase" do 
  expect(abc_phrase).to eq(BraillePhrase)
end

it "has a place to store the letters that make up the phrase" do 
  expect(abc_phrase.letters).to eq([])

end

it "can add the braille phrases in an ordered fashion to the letters array" do 
  abc_phrase.add_letter(a_braille)
  abc_phrase.add_letter(b_braille)
  abc_phrase.add_letter(c_braille)
  abc_phrase.add_letter(space_braille)
  abc_phrase.add_letter(a_braille)

  expect(abc_phrase.letters).to eq([a_braille, b_braille, c_braille, space_braille, a_braille])
end