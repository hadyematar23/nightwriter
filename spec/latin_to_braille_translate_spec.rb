require 'spec_helper'

RSpec.describe LatinToBraille do
let(:file){File.open("braille.txt", "w")}
let(:dictionary){Dictionary.new}
let(:a_braille){BrailleLetter.new("a","0.!..!..")}
let(:b_braille){BrailleLetter.new("b","0.!0.!..")}
let(:c_braille){BrailleLetter.new("c","00!..!..")}
let(:space_braille){BrailleLetter.new("space", "..!..!..")}

it "when input of a Latin letter is provided it will return the braille equivalent" do 
  phrase = "a"
  latin_to_braille_translate = LatinToBraille.new(phrase, file)
  expect(latin_to_braille_translate.translate_l_to_braille(phrase)).to eq(["0.!..!.."])
end

it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
  phrase = "hello w"
  latin_to_braille_translate = LatinToBraille.new(phrase, file)
  expect(latin_to_braille_translate.translate_l_to_braille(phrase)).to eq(["0.!00!..", "0.!.0!..", "0.!0.!0.", "0.!0.!0.", "0.!.0!0.", "..!..!..", ".0!00!.0"])

end

it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
  phrase = "a lazy fox"
  latin_to_braille_translate = LatinToBraille.new(phrase, file)
  expect(latin_to_braille_translate.translate_l_to_braille(phrase)).to eq(["0.!..!..", "..!..!..", "0.!0.!0.", "0.!..!..", "0.!.0!00", "00!.0!00", "..!..!..", "00!0.!..", "0.!.0!0.", "00!..!00"])

end

context "printing the braille array to the console" do 
  it "the first element of the print_phrase array represents the first uppermost row of the braille character" do 
    phrase = "a"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    expect(latin_to_braille_translate.print_phrase(braille_array)[0]).to eq("0.")
  end 

  it "the second element of the print_phrase array represents the middle row of the braille character" do 
    phrase = "a"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    expect(latin_to_braille_translate.print_phrase(braille_array)[1]).to eq("..")
  end 

  it "the third and final element of the print_phrase array represents the bottom row of the braille character" do 
    phrase = "a"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    expect(latin_to_braille_translate.print_phrase(braille_array)[2]).to eq("..")
  end 

  it "when you want to print two letters together, the first element of the print_phrase array will include the uppermost rows of both braille characters respectively" do 
    phrase = "ab"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    expect(latin_to_braille_translate.print_phrase(braille_array)[0]).to eq("0.0.")
    expect(latin_to_braille_translate.print_phrase(braille_array)[1]).to eq("..0.")
    expect(latin_to_braille_translate.print_phrase(braille_array)[2]).to eq("....")
    
  end

  it "transposes the braille to put it in the correct format and prints to the txt file" do 
    phrase = "help"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    expect(latin_to_braille_translate.print_phrase(braille_array)).to eq(["0.0.0.00", "00.00.0.", "....0.0."])
  end

  it "after transposing the braille to put it in the correct format it prints to the txt file" do 
    phrase = "help"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    latin_to_braille_translate.print_phrase(braille_array)
    expect(latin_to_braille_translate.read_file).to eq("0.0.0.00\n00.00.0.\n....0.0.\n")
  end

  it "can cut the braille lines over 80 characters long into only 80 characters long" do 
    phrase = "the quick brown fox jumps over the lazy dog is a"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    over_eighty = latin_to_braille_translate.print_phrase(braille_array)
    expect(latin_to_braille_translate.cut_to_eighty(over_eighty)).to eq([[".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..", "0000.0..00..0.......0.00.000.0..0..0....00....0.0....00..000..0000.0..0....0.0..", "0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000.."], ["000.00...0.0..0.", ".0.000..0.0.....", "..0.......0....."]])
  end

  it "can do this even if the length is well over 160 characters" do 
    phrase = "there seems to be a minor — but growing — trend in fanfiction to have the story's title written entirely in lowercase, while the story itself uses correct capitalizations"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    over_eighty = latin_to_braille_translate.print_phrase(braille_array)
    expect(latin_to_braille_translate.cut_to_eighty(over_eighty)).to eq([[".00.0.0.0....00.0.00.0...00...0.0...0...00.0000.0.....0.0..0..000.0..0.00000....", "0000.000.0..0..0.0..0...00.0..0..0........0..0.000....0...00..0000.0000..000....", "0.....0.....0.....0.0...0.0.............0...0.0.0.......000.....0.0..0..0......."],
    [".00.0.0000...000..000.0000.000.0.00.00...00...0.0.0.0....00.0....0.00.0.00.0...0","0000.0.0.0..0..0..0....00.0...000..0.0..00.0..00..0..0..0000.0..0.00.000.00...00", "0.0...0.......0.......0.......0...0.0...0.0.......00....0.......0.0.0.0.000...0."],
    [".0.00.0....00..0.0.00.00..0.00.0.00.0.0.00...000..0.0..00.0.000..00....00..00.0.", "0.000..0..00000.0000.0.0...0.0000.00.00..0..0..0..0..000.000....0..0..00000.0..0", "..0.0......00...0.0...0.....0.0...0...0.00....0...0.0..0..0.....0......0....0..."],
    ["...00.0....0.00.0.00...0.0.00.0.00..0..00..0..000.0.0.0.00.0..000.00.0.00.0..00.","..0000.0..0.00.000.0..0.000..00.0.....0..00......00000.0..00......0.0.00..0.0..0","..0.......0.0.0.0.00....0.0...0.....000...0.....0.0.0.....0.......0...0...0...00"],
    ["0..0.00.00.0", "..000..0.00.", "..0...0.0.0."]])
  end


  it "it inserts a blank array between each line of braille so that when it prints to the text file, it will be easier for a visual or non-visual individual to decipher the lines" do 
    phrase = "the quick brown fox jumps over the lazy dog is a"
    latin_to_braille_translate = LatinToBraille.new(phrase, file)
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    over_eighty = latin_to_braille_translate.print_phrase(braille_array)
    under_eighty = latin_to_braille_translate.cut_to_eighty(over_eighty)
    expect(latin_to_braille_translate.add_blank_space(under_eighty)).to eq([[".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..", "0000.0..00..0.......0.00.000.0..0..0....00....0.0....00..000..0000.0..0....0.0..", "0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000.."], [" "], ["000.00...0.0..0.", ".0.000..0.0.....", "..0.......0....."]])
  end
end 
end 