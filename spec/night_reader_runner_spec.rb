require 'spec_helper'

RSpec.describe NightReaderClass do 
  let(:files){["braille.txt", "original_message.txt"]}
  let(:night_reader_class){NightReaderClass.new(files)}

  describe "the initialize portion" do 
    it "the first action when input is to open an existing file that is a File object" do 
      expect(night_reader_class.braille_file).to be_an_instance_of(File)
    end

    it "the new file that is created after the first file is also a File object" do 
      expect(night_reader_class.original_message_file).to be_an_instance_of(File)
    end 

    it "the path of the new file created is what is the second input into the command line, in this case original_message.txt" do 
      expect(night_reader_class.new_file.path).to eq("original_message.txt")
    end
  end 
  describe "testing the input from message.txt and its output into braille.txt" do 
    # I made some dummy files to make the testing easier. I could not figure out how to stub a file without creating a txt file. I used "help" in English and its equivalent in Braille = "0.0.0.00\n00.00.0.\n....0.0.\n" 
    it "the braille.txt file starts out with some input information which can be read" do
      file_path = File.expand_path("dummy_testing_files/dummy_braille_info.txt")
      files = [file_path, "original_message.txt"]

      night_reader_class= NightReaderClass.new(files)
      expect(night_reader_class.phrase).to eq("0.0.0.00\n00.00.0.\n....0.0.\n")
    end
  end 

  # describe "converting the braille to Latin script" do 
  #   it "after converting the braille in the first file of ARGV to latin script, will print the latin script to the second folder (ARGV[1])" do 



  #   end
  # end 

  # context "printing converted results to the console" do 
  #   it "will then print to the console a statement indicating how many latin characters were translated from braille and printed to the text file created" do 




  #   end
  # end 


end