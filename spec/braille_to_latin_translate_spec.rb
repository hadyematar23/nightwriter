require 'spec_helper'

RSpec.describe BrailleToLatin do
let(:file){File.open("original_message.txt", "w")}
let(:dictionary){Dictionary.new}
let(:a_braille){BrailleLetter.new("a","0.!..!..")}
let(:b_braille){BrailleLetter.new("b","0.!0.!..")}
let(:c_braille){BrailleLetter.new("c","00!..!..")}
let(:space_braille){BrailleLetter.new("space", "..!..!..")}

it "when input of a braille reading of the txt file is provided it will return the braille equivalent- one letter" do 
  phrase = ".0\n00\n0."
  braille_to_latin_translate = BrailleToLatin.new(phrase, file)
  expect(braille_to_latin_translate.translate_braille_to_l(phrase)).to eq("t")
  end

it "when input of a braille reading of the txt file is provided it will return the braille equivalent-seven characters" do 
  phrase = ".00.0...000..0\n0000.0......00\n0...........0.\n"
  braille_to_latin_translate = BrailleToLatin.new(phrase, file)
  expect(braille_to_latin_translate.translate_braille_to_l(phrase)).to eq("the cat")
  end

it "also works with very long scripts" do 
  phrase = ".00.0...0.0.0.00..000.00...00.00000.00..0.0..0.0.0000...0.00...00.0...0.0.000.0.0.0...0.0000..0.0.00..0..00.00..000.0.00...00.0...000..0000.0.00...00.0..0..0.0.00..000...0.0.0.00\n0000.0..0....0.0..0..0....00....0..0.0...0..000.0..0.0...00...0000.0..00.0.000.00..0.....0.0..00...0....00...0..0.00.0....0000.0....000......0.0..0000..00..00...0...0.0..00.0...0\n0.......0...0000....0.00....000.0.......0.000.0.........0.....0...........0...0.0.......0.....0...0......0..00....0.0.0...0...............0...0...0.....0...........0.0..........."
  braille_to_latin_translate = BrailleToLatin.new(phrase, file)
  expect(braille_to_latin_translate.translate_braille_to_l(phrase)).to eq("the lazy fox jumped outside of the henhole and ran away from the chicken that had no head")
end

it "this also works with longer scripts in which each braille line is cut off at 80 characters maximum" do 
  phrase = ".00.0...0.0.0.00..000.00...00.00000.00..0.0..0.0.0000...0.00...00.0...0.0.000.0.\n0000.0..0....0.0..0..0....00....0..0.0...0..000.0..0.0...00...0000.0..00.0.000.0\n0.......0...0000....0.00....000.0.......0.000.0.........0.....0...........0...0.\n \n0.0...0.0000..0.0.00..0..00.00..000.0.00...00.0...000..0000.0.00...00.0..0..0.0.\n0..0.....0.0..00...0....00...0..0.00.0....0000.0....000......0.0..0000..00..00..\n0.......0.....0...0......0..00....0.0.0...0...............0...0...0.....0.......\n \n00..000...0.0.0.00\n.0...0.0..00.0...0\n....0.0...........\n"
  braille_to_latin_translate = BrailleToLatin.new(phrase, file)
  expect(braille_to_latin_translate.translate_braille_to_l(phrase)).to eq("the lazy fox jumped outside of the henhole and ran away from the chicken that had no head")
  end
end 