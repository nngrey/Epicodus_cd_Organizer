require 'rspec'
require 'album'
require 'artist'

describe Organizer do
  before do
    Organizer.clear
  end

  it 'is initialized with a hash of attributes' do
    test_cd = Organizer.new({:album => 'White Album', :artist => 'The Beatles'})
    test_cd.should be_an_instance_of Organizer
  end

  describe '.search' do
    it 'loops through the organizer master array and returns album searched for' do
      test_cd = Organizer.new({:album => 'White Album', :artist => 'The Beatles'})
      Organizer.search('The Beatles').should eq [test_cd]
    end
  end

  describe '.artist_albums' do
    it "takes an artist's name and returns all his/her albums" do
      test_cd = Organizer.new({:album => 'White Album', :artist => 'The Beatles'})
      test_cd = Organizer.new({:album => 'Abbey Road', :artist => 'The Beatles'})
      Organizer.artist_albums('The Beatles').should eq ['White Album', 'Abbey Road']
    end
  end

  describe '#save' do
    it 'saves a new cd instance to a class array' do
      test_cd = Organizer.new({:album => 'White Album', :artist => 'The Beatles'})
      Organizer.all.should eq [test_cd]
    end
  end
end
