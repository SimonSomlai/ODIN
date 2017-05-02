require 'spec_helper'
require 'cypher'

describe '.cypher, when' do
  context "given ('What a string!', 1) as parameter" do
    it "should return 'Xibu b tusjoh!'" do
      expect(cypher('What a string!', 1)).to eql('Xibu b tusjoh!')
    end
  end

  context 'given (string, 1) and (string, 27)' do
    it 'should return the same things' do
      expect(cypher('What a string!', 1)).to eql(cypher('What a string!', 27))
    end
  end
end

describe '.replace, when' do
  it 'given a symbol should return that symbol' do
    expect(replace("!", 21)).to be == "!"
  end

  it "given an uppercase letter should return an uppercase letter" do
    expect(replace("M", 26)).to be == "M"
  end

  it "given a downcase letter should return a downcase letter" do
    expect(replace("m", 26)).to be == "m"
  end
end
