require 'spec_helper'

RSpec.describe NightWriterRunner do
  let(:night_writer_runner){NightWriterRunner.new}
  describe "#initialize" do 
    it "exists as an object" do 
      
      night_writer_runner = NightWriterRunner.new
      expect(night_writer_runner).to be_an_instance_of(NightWriterRunner)

    end
  end
end