require 'spec_helper'


describe XDR::Read::Float32, "#read" do

  it "decodes values correctly" do
    expect(read("\x00\x00\x00\x00")).to eq(0.0)
    expect(read("\x80\x00\x00\x00")).to eq(-0.0)
    expect(read("\x3F\x80\x00\x00")).to eq(1.0)
    expect(read("\xBF\x80\x00\x00")).to eq(-1.0)
  end

  def read(str)
    io = StringIO.new(str)
    subject.read(io)
  end
end