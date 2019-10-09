require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/house.rb'
require_relative '../lib/room.rb'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 Sugar Lane")
    @room = Room.new(:bedroom, 10, 15)
    @room2 = Room.new(:bedroom, 10, 14)
  end

  def test_it_exist
    assert_instance_of House, @house
  end

  def test_it_has_a_price
    assert_equal "$400000", @house.price
  end

  def test_it_has_an_address
    assert_equal "123 Sugar Lane", @house.address
  end

  def test_it_has_no_rooms_by_default
    assert_equal [], @house.rooms
  end

  def test_add_room_method
    @house.add_room(@room)
    assert_equal [@room], @house.rooms
    @house.add_room(@room2)
    assert_equal [@room, @room2], @house.rooms
  end
end