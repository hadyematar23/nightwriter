require 'spec_helper'

RSpec.describe LatinLetter do
let(:a){Letter.new("a")}
let(:b){Letter.new("b")}

  it "exists as a letter" do 

    expect(a).to be_an_instance_of(Letter)
    expect(b).to be_an_instance_of(Letter)

  end 

  it "has a name" do 
    
    expect(a.name).to eq("a")
    expect(b.name).to eq("b")

  end