require 'spec_helper'

RSpec.describe BraillePhrase do
let(:a_braille){BrailleLetter.new("a","0.\n..\n..")}
let(:b_braille){BrailleLetter.new("b","0.\n0.\n..")}
let(:c_braille){BrailleLetter.new("c","00\n..\n..")}
let(:abc_phrase){BraillePhrase.new}
let(:space_braille){BrailleLetter.new("space", "..\n..\n..")}

it "exists as a braille phrase" do 
  expect(abc_phrase).to be_an_instance_of(BraillePhrase)
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

  expect(abc_phrase.letters).to eq(["0.\n..\n..", "0.\n0.\n..", "00\n..\n..", "..\n..\n..", "0.\n..\n.."])
end

it "when printing the braille phrase, an array is created with three elements" do 
  abc_phrase.add_letter(a_braille)
  abc_phrase.add_letter(b_braille)

  expect(abc_phrase.print_phrase).to be_an_instance_of(Array)
  expect(abc_phrase.print_phrase.count).to eq(3)
end

it "when printing the braille phrase, the first element of the array is a string and is made up of the top row of each braille character" do 
  abc_phrase.add_letter(a_braille)

  expect(abc_phrase.print_phrase).to all(be_a(String))
  expect(abc_phrase.print_phrase[0].length).to eq(2)
  expect(abc_phrase.print_phrase[1].length).to eq(2)
  expect(abc_phrase.print_phrase[2].length).to eq(2)

end 

it "the first element of the print_phrase array represents the first uppermost row of the braille character" do 
  abc_phrase.add_letter(a_braille)

  expect(abc_phrase.print_phrase[0]).to eq("0.")
end 

it "the second element of the print_phrase array represents the middle row of the braille character" do 
  abc_phrase.add_letter(a_braille)

  expect(abc_phrase.print_phrase[1]).to eq("..")
end 

it "the third and final element of the print_phrase array represents the bottom row of the braille character" do 
  abc_phrase.add_letter(a_braille)

  expect(abc_phrase.print_phrase[2]).to eq("..")
end 

it "when you want to print two letters together, the first element of the print_phrase array will include the uppermost rows of both braille characters respectively" do 
  abc_phrase.add_letter(a_braille)
  abc_phrase.add_letter(b_braille)

  expect(abc_phrase.print_phrase)[0].to eq("0.0.")
end

end