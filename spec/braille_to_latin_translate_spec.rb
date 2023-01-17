require 'spec_helper'

RSpec.describe BrailleToLatin do
let(:files){["braille.txt", "original_message.txt"]}
let(:dictionary){Dictionary.new}
let(:braille_to_latin_translate){BrailleToLatin.new(files)}

describe "the initialize portion" do 
  it "exists as an object of BrailleToLatin" do 
    expect(braille_to_latin_translate).to be_an_instance_of(BrailleToLatin)
  end

  it "the file that is read from, in this case, braille.txt, is a file object and exists" do 
    expect(Pathname.new('braille.txt')).to exist
  end
end 

describe "input braille from braille.txt and output latin letters" do 
  it "it modifies the script of the braille dictionary to remove the exclamation points" do 
    expect(braille_to_latin_translate.modify_script[0].representation).to eq("0.....")
    expect(braille_to_latin_translate.modify_script[1].representation).to eq("0.0...")
    expect(braille_to_latin_translate.modify_script[2].representation).to eq("00....")
    expect(braille_to_latin_translate.modify_script[-1].representation).to eq("......")
  end

  it "takes the braille phrase and splits it into three different lines based on where there is a space" do 
    braille_phrase_from_file = ".00.0.\n0000.0\n0....."
    expect(braille_to_latin_translate.split_lines(braille_phrase_from_file)).to eq([".00.0.", "0000.0", "0....."])   
  end

  it "takes the first top two dots of every braille letter and puts them in the same string with its remaining four dots so it's a readable method for the computer" do 
    argument = [".00.0.", "0000.0", "0....."]
    expect(braille_to_latin_translate.translate_method(argument)).to eq ([".0000.", "0.00..", "0..0.."])
  end 

  it "there is a helper method to do the above that splits up the mechanism based on whether there are more than 3 split lines" do 
    already_split = [".00.0.", "0000.0", "0....."]
    expect(braille_to_latin_translate.create_representations(already_split)).to eq([".0000.", "0.00..", "0..0.."])   
  end

  it "if the lines split are more than three lines (possibly beceause there was an 80 character limit on the length of braille lines), the method can handle that as it splits the arrays into groups of three and iterates over each group of three in turn" do 
    already_split = [".00.0...0.0.0.00..000.00...00.00000.00..0.0..0.0.0000...0.00...00.0...0.0.000.0.",
    "0000.0..0....0.0..0..0....00....0..0.0...0..000.0..0.0...00...0000.0..00.0.000.0",
    "0.......0...0000....0.00....000.0.......0.000.0.........0.....0...........0...0.",
    " ",
    "0.0...0.0000..0.0.00..0..00.00..000.0.00...00.0...000..0000.0.00...00.0..0..0.0.",
    "0..0.....0.0..00...0....00...0..0.00.0....0000.0....000......0.0..0000..00..00..",
    "0.......0.....0...0......0..00....0.0.0...0...............0...0...0.....0.......",
    " ",
    "00..000...0.0.0.00",
    ".0...0.0..00.0...0",
    "....0.0..........."]
    expect(braille_to_latin_translate.create_representations(already_split)[-1]).to eq("00.0..")  
    expect(braille_to_latin_translate.create_representations(already_split)[1]). to eq("0.00..")
  end

  it "then takes the ordered array of braille letters and converts it into latin letters" do 
    representations = [".0000.","0.00..", "0..0.."]
    expect(braille_to_latin_translate.iterate_to_latin(representations)).to eq("the")
  end

  it "then takes the ordered array of braille letters and converts it into latin letters" do 
    representations = ["0.00..","0..0..", "0.0.0.", "0.0.0.", "0..00.","......", ".000.0" ]
    expect(braille_to_latin_translate.iterate_to_latin(representations)).to eq("hello w")
  end

  it "there is one helper method which combines all of the above- taking braille from the file and outputting a latin phrase " do 
    phrase_to_translate = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0..."

    expect(braille_to_latin_translate.translate_phrase(phrase_to_translate)).to eq("hello world")
  end
end 
 
  it "will create and print the translated phrase to the text file" do
    translated_phrase = "hello world"
    braille_to_latin_translate.print_to_txt_file(translated_phrase, files[1])
    expect(Pathname.new('original_message.txt')).to exist
  end
  
context "counting and printing the characters to the console" do 
  it "can count the number of characters in the newly created file" do 
    files = ["braille.txt", "dummy_testing_files/dummy_latin_text.txt"]
    expect(braille_to_latin_translate.count(files[1])).to eq(11)
  end

  it "can then print the file name and length to the console" do 
    length = 23
    expect(braille_to_latin_translate.print(length, files[1])).to eq("Created original_message.txt containing 23 characters")
  end

  it "integration test" do 
    files = ["braille.txt", "dummy_testing_files/dummy_latin_text.txt"]
    expect(braille_to_latin_translate.print_to_console(files[1])).to eq("Created dummy_testing_files/dummy_latin_text.txt containing 11 characters")
  end
  end
end 
