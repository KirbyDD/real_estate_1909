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
    @room3 = Room.new(:living_room, 25, 15)
    @room4 = Room.new(:basement, 30, 40)
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

  def test_rooms_from_category_method
    @house.add_room(@room)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal [@room, @room2], @house.rooms_from_category(:bedroom)
    assert_equal [@room3], @house.rooms_from_category(:living_room)
    assert_equal [@room4], @house.rooms_from_category(:basement)
  end

  def test_area_test
    @house.add_room(@room)
    @house.add_room(@room2)
    assert_equal 290, @house.area

    @house.add_room(@room3)
    assert_equal 665, @house.area

    @house.add_room(@room4)
    assert_equal 1865, @house.area
  end

  def test_price_per_square_foot_method

    @house.add_room(@room)
    @house.add_room(@room2)
    assert_equal 1379.31, @house.price_per_square_foot

    @house.add_room(@room3)
    assert_equal 601.50, @house.price_per_square_foot

    @house.add_room(@room4)
    assert_equal 214.47, @house.price_per_square_foot
  end

  def test_sort_by_area_method
    @house.add_room(@room)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)
    assert_equal [@room, @room2, @room3, @room4], @house.rooms
    assert_equal [@room4, @room3, @room2, @room1], @house.sort_by_area
  end

  def test_rooms_by_category_method
    skip
    @house.add_room(@room)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)
    expectedResult = { :bedroom => [@room1, @room2], :living_room => [@room3], :basement => [@room4]}
    assert_equal expectedResult, @house.rooms_by_category
  end
end