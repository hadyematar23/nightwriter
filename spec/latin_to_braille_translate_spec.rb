require 'spec_helper'

RSpec.describe LatinToBraille do
let(:file1){File.open(files[0], "r")}
let(:file2){File.new(files[1], "w")}
let(:files){[file1, file2]}
let(:dictionary){Dictionary.new}
let(:a_braille){BrailleLetter.new("a","0.!..!..")}
let(:b_braille){BrailleLetter.new("b","0.!0.!..")}
let(:c_braille){BrailleLetter.new("c","00!..!..")}
let(:space_braille){BrailleLetter.new("space", "..!..!..")}
let(:files){["message.txt", "braille.txt"]}
let(:latin_to_braille_translate){LatinToBraille.new(files)}
# let(:night_writer_class){NightWriterClass.new(files)}


describe "the initialize portion" do 
  it "exists as an object of latintobrailletranslate" do 
    latin_to_braille_translate
    expect(latin_to_braille_translate).to be_an_instance_of(LatinToBraille)
  end

  it "the file that is read from, in this case message.txt, is a file object and exists" do 
    expect(Pathname.new('message.txt')).to exist
  end

  # it "creates a new file into which we will be writing the object" do 
  #   expect(night_writer_class.new_file).to be_an_instance_of(File)
  # end 

  # it "the path of the new file created is what is the second input into the command line, in this case braille2.txt" do 
  #   expect(night_writer_class.new_file.path).to eq("braille.txt")
  # end
end 
describe "testing the input from message.txt and its output into braille.txt" do 
  it "takes the information in the original file and puts it into a string that counts the number of characters" do 
    
    file1= File.open('dummy_testing_files/dummy_latin_text.txt')
    expect(latin_to_braille_translate.count(file1)).to eq(29)

  end

  it "outputs a string that indicates how many characters are in the original message file" do 
    length = 96
    file_name = files[1]
    expect(latin_to_braille_translate.print(length, file_name)).to eq("Created braille.txt containing 96 characters")
  end

  it "does an integration test to make sure the entire part works together" do 
    file1= File.open('dummy_testing_files/dummy_latin_text.txt')
    file_name = files[1]
    expect(latin_to_braille_translate.print_to_console(file1, file_name)).to eq("Created braille.txt containing 29 characters")
  end
end 

it "when input of a Latin letter is provided it will return the braille equivalent" do 
  phrase = "a"
  expect(latin_to_braille_translate.translate_phrase(phrase)).to eq(["0.!..!.."])
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