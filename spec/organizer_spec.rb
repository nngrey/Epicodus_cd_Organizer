require 'rspec'
require "organizer"

describe Organizer do
  before do
    Organizer.clear
  end

  it 'is initialized with a hash of attributes' do
    test_cd = Organizer.new({:album => 'White Album', :artist => 'The Beatles'})
    test_cd.should be_an_instance_of Organizer
  end

  describe '#save' do
    it 'saves a new cd instance to a class array' do
      test_cd = Organizer.new({:album => 'White Album', :artist => 'The Beatles'})
      Organizer.all.should eq [test_cd]
    end
  end
end
