require 'spec_helper'

RSpec.describe LatinToBraille do
let(:dictionary){Dictionary.new}
let(:files){["message.txt", "braille.txt"]}
let(:latin_to_braille_translate){LatinToBraille.new(files)}

describe "the initialize portion" do 
  it "exists as an object of LatintoBraille" do 
    expect(latin_to_braille_translate).to be_an_instance_of(LatinToBraille)
  end

  it "the file that is read from, in this case message.txt, is a file object and exists" do 
    expect(Pathname.new('message.txt')).to exist
  end

  it "creates a new file into which we will be writing the object" do 
    latin_to_braille_translate
    expect(Pathname.new('braille.txt')).to exist
  end 
end 
describe "testing the input from message.txt and its output into braille.txt" do 
  it "takes the information in the original file and puts it into a string that counts the number of characters" do 
    
    file1= File.open('dummy_testing_files/dummy_latin_text.txt')
    expect(latin_to_braille_translate.count(file1)).to eq(11)

  end

  it "outputs a string that indicates how many characters are in the original message file" do 
    length = 96
    file_name = files[1]
    expect(latin_to_braille_translate.print(length, file_name)).to eq("Created braille.txt containing 96 characters")
  end

  it "does an integration test to make sure the entire part works together" do 
    file1= File.open('dummy_testing_files/dummy_latin_text.txt')
    file_name = files[1]
    expect(latin_to_braille_translate.print_to_console(file1, file_name)).to eq("Created braille.txt containing 11 characters")
  end
end 
context "input latin letters or phrases and return array of braille pre-transposed" do 
  it "when input of a Latin letter is provided it will return the braille equivalent" do
    phrase_to_translate = "a"
    expect(latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)).to eq(["0.!..!.."])
  end

  it "when input of multiple letters is provided, it will return the braille equivalent in an array" do 
    phrase_to_translate = "the"
    expect(latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)).to eq([".0!00!0.", "0.!00!..", "0.!.0!.."])
  end 

  it "when the input includes capitalized letters, it will turn them into lowercase letters and then return the equivalent in an array" do 
    phrase_to_translate = "THE"
    expect(latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)).to eq([".0!00!0.", "0.!00!..", "0.!.0!.."])
  end

  # it "when the input includes punctuation marks, it will disregard those and just return the letters, both capitalized and lowercase" do 
    
  #   expect()
  # end

  it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
    phrase_to_translate = "hello w"
    expect(latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)).to eq(["0.!00!..", "0.!.0!..", "0.!0.!0.", "0.!0.!0.", "0.!.0!0.", "..!..!..", ".0!00!.0"])
  end

  it "when input of a Latin phrase is provided, it will return the braille equivalent of the phrase" do 
    phrase_to_translate = "a lazy fox"
    expect(latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)).to eq(["0.!..!..", "..!..!..", "0.!0.!0.", "0.!..!..", "0.!.0!00", "00!.0!00", "..!..!..", "00!0.!..", "0.!.0!0.", "00!..!00"])
  end
end 

context "transposing the braille array" do 
  it "the first element of the transpose_phrase array represents the first uppermost row of the braille character" do 
    braille_array = ["0.!..!.."]
    expect(latin_to_braille_translate.transpose_phrase(braille_array)[0]).to eq("0.")
  end 

  it "the second element of the transpose_phrase array represents the middle row of the braille character" do 
    braille_array = ["0.!..!.."]
    expect(latin_to_braille_translate.transpose_phrase(braille_array)[1]).to eq("..")
  end 

  it "the third and final element of the transpose_phrase array represents the bottom row of the braille character" do 
    braille_array = ["0.!..!.."]
    expect(latin_to_braille_translate.transpose_phrase(braille_array)[2]).to eq("..")
  end 

  it "transposes the braille to put it in the correct format and prints to the txt file" do 
    braille_array = ["0.!00!..", "0.!.0!..", "0.!0.!0.", "00!0.!0."]
    expect(latin_to_braille_translate.transpose_phrase(braille_array)).to eq(["0.0.0.00", "00.00.0.", "....0.0."])
  end

  it "does this with an integration test, taking a latin phrase and resulting in a transposed array" do 
    phrase = "help"
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase)
    expect(latin_to_braille_translate.transpose_phrase(braille_array)).to eq(["0.0.0.00", "00.00.0.", "....0.0."])
  end
end 

  it "can cut the braille lines over 80 characters long into only 80 characters long" do 
    phrase_to_translate = "the quick brown fox jumps over the lazy dog is a"
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)
    over_eighty = latin_to_braille_translate.transpose_phrase(braille_array)

    expect(latin_to_braille_translate.cut_to_eighty(over_eighty)).to eq([[".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..", "0000.0..00..0.......0.00.000.0..0..0....00....0.0....00..000..0000.0..0....0.0..", "0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000.."], ["000.00...0.0..0.", ".0.000..0.0.....", "..0.......0....."]])
  end

  it "can do this even if the length is well over 160 characters" do 
    phrase_to_translate = "there seems to be a minor — but growing — trend in fanfiction to have the story's title written entirely in lowercase, while the story itself uses correct capitalizations"
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)
    over_eighty = latin_to_braille_translate.transpose_phrase(braille_array)

    expect(latin_to_braille_translate.cut_to_eighty(over_eighty)).to eq([[".00.0.0.0....00.0.00.0...00...0.0...0...00.0000.0.....0.0..0..000.0..0.00000....", "0000.000.0..0..0.0..0...00.0..0..0........0..0.000....0...00..0000.0000..000....", "0.....0.....0.....0.0...0.0.............0...0.0.0.......000.....0.0..0..0......."],
    [".00.0.0000...000..000.0000.000.0.00.00...00...0.0.0.0....00.0....0.00.0.00.0...0","0000.0.0.0..0..0..0....00.0...000..0.0..00.0..00..0..0..0000.0..0.00.000.00...00", "0.0...0.......0.......0.......0...0.0...0.0.......00....0.......0.0.0.0.000...0."],
    [".0.00.0....00..0.0.00.00..0.00.0.00.0.0.00...000..0.0..00.0.000..00....00..00.0.", "0.000..0..00000.0000.0.0...0.0000.00.00..0..0..0..0..000.000....0..0..00000.0..0", "..0.0......00...0.0...0.....0.0...0...0.00....0...0.0..0..0.....0......0....0..."],
    ["...00.0....0.00.0.00...0.0.00.0.00..0..00..0..000.0.0.0.00.0..000.00.0.00.0..00.","..0000.0..0.00.000.0..0.000..00.0.....0..00......00000.0..00......0.0.00..0.0..0","..0.......0.0.0.0.00....0.0...0.....000...0.....0.0.0.....0.......0...0...0...00"],
    ["0..0.00.00.0", "..000..0.00.", "..0...0.0.0."]])
  end


  it "it inserts a blank array between each line of braille so that when it prints to the text file, it will be easier for a visual or non-visual individual to decipher the lines" do 
    phrase_to_translate = "the quick brown fox jumps over the lazy dog is a"
    braille_array = latin_to_braille_translate.translate_l_to_braille(phrase_to_translate)
    over_eighty = latin_to_braille_translate.transpose_phrase(braille_array)
    under_eighty = latin_to_braille_translate.cut_to_eighty(over_eighty)

    expect(latin_to_braille_translate.add_blank_space(under_eighty)).to eq([[".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..", "0000.0..00..0.......0.00.000.0..0..0....00....0.0....00..000..0000.0..0....0.0..", "0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000.."], [" "], ["000.00...0.0..0.", ".0.000..0.0.....", "..0.......0....."]])
  end

  it "there is one helper method that takes this from latin letters to braille ready to print to the console" do 
    phrase_to_translate = "the quick brown fox jumps over the lazy dog is a"

    expect(latin_to_braille_translate.translate_phrase(phrase_to_translate)).to eq([[".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..", "0000.0..00..0.......0.00.000.0..0..0....00....0.0....00..000..0000.0..0....0.0..", "0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000.."], [" "], ["000.00...0.0..0.", ".0.000..0.0.....", "..0.......0....."]])
  end
end 