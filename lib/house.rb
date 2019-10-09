class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room room
    @rooms << room
  end

  def rooms_from_category category 
    @rooms.find_all {|room| room.category == category}
  end

  def area 
    result = 0
    @rooms.each do |room|
      result += room.area
    end
    result
  end

  def sort_by_area
    result = @rooms.sort {|a, b| b.area <=> a.area}
    result
  end
end