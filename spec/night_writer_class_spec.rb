require 'spec_helper'

RSpec.describe NightWriterClass do
  let(:files){["message.txt", "braille.txt"]}
  let(:night_writer_class){NightWriterClass.new(files)}

  describe "the initialize portion" do 
    it "the first action when input is to open an existing file that is a File object" do 
      expect(night_writer_class.message_file).to be_an_instance_of(File)
    end

    it "the new file that is created after the first file is also a File object" do 
      expect(night_writer_class.new_file).to be_an_instance_of(File)
    end 

    it "the path of the new file created is what is the second input into the command line, in this case braille2.txt" do 
      expect(night_writer_class.new_file.path).to eq("braille.txt")
    end
  end 
  describe "testing the input from message.txt and its output into braille.txt" do 

    it "the message.txt file starts out with some input information which can be read" do 
      expect(night_writer_class.phrase).to eq("the quick brown fox jumps over the lazy dog is a sentence which has every letter of the alphabet")
      
    end

    it "takes the information in the original file and puts it into a string that counts the number of characters" do 
      expect(night_writer_class.count).to eq(96)

    end

    it "outputs a string that indicates how many characters are in the original message file" do 
      length = 96
      expect(night_writer_class.print(length)).to eq("Created braille.txt containing 96 characters")
    end
  end 

end