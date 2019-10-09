require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/room.rb'

class RoomTest < Minitest::Test
  def setup
    @room = Room.new(:bedroom, 10, 15)
  end

  def test_it_exist
    assert_instance_of Room, @room
  end

  def test_it_has_a_category
    assert_equal :bedroom, @room.category
  end

  def test_area_method
    assert_equal 150, @room.area
  end
end