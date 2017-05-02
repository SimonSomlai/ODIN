require 'spec_helper'
require 'zombie'

describe Zombie do
  zombie = Zombie.new
  it 'is named Ash' do
    expect(zombie.name).to eq('Ash')
  end

  it 'has no brains' do
    expect(zombie.brains).to be < 1
  end

  it 'should be dead' do
    expect(zombie.dead).to be true
    expect(zombie.alive).to be false
  end
end

describe
