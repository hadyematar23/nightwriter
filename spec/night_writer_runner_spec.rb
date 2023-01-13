require 'spec_helper'

RSpec.describe NightWriterRunner do
  let(:files){["message.txt", "braille.txt"]}
  let(:night_writer_runner){NightWriterRunner.new(files)}

  describe "the initialize portion" do 
    it "the first action when input is to open an existing file that is a File object" do 

      expect(night_writer_runner.message_file).to be_an_instance_of(File)
    end

    it "the new file that is created after the first file is also a File object" do 

      
      expect(night_writer_runner.new_file).to be_an_instance_of(File)
    end 

    it "the message.txt file starts out with some input information which can be read" do 
      expect(night_writer_runner.message_file.read).to eq("the quick CAPITALIZEbrown fox jumps over the lazy dog is a sentence which has every letter of the alphabet")
      
    end

    it "when the actual method is run, the message.txt file is then turned into downcase and written into the new file" do 
      night_writer_runner.copy_file
      expect(night_writer_runner.read_file.read).to eq("the quick capitalizebrown fox jumps over the lazy dog is a sentence which has every letter of the alphabet")

    end

    it "takes the information in the new/copied file and puts it into a string that counts the number of characters" do 
      night_writer_runner.copy_file
      expect(night_writer_runner.count_number).to eq(106)

    end

    it "outputs a string that indicates how many characters are in the new_file" do 
      expect(night_writer_runner.run).to eq("Created braille.txt containing 106 characters")
    end

  end 
end