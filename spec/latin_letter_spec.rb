require 'spec_helper'

RSpec.describe LatinLetter do
let(:a){LatinLetter.new("a")}
let(:b){LatinLetter.new("b")}

  it "exists as a letter" do 

    expect(a).to be_an_instance_of(LatinLetter)
    expect(b).to be_an_instance_of(LatinLetter)

  end 

  it "has a name" do 

    expect(a.name).to eq("a")
    expect(b.name).to eq("b")

  end
end 