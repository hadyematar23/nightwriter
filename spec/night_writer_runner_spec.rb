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
      expect(night_writer_runner.message_file.read).to eq("the quick brown fox jumps over the lazy dog is a sentence which has every letter of the alphabet")
      
    end

    it "the message.txt file can be added ot and therefore change its output when read" do 
      require 'pry'; binding.pry


      expect(night_writer_runner.message_file.read).to eq("the quick brown fox jumps over the lazy dog is a sentence which has every letter of the alphabet. this result establishes that i changed it.")

    end

  end 
end