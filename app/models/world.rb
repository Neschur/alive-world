class World
  attr_reader :ground

  def initialize(ground)
    @ground = ground
    @size = fetch_size_from_ground(ground)
  end

  attr_reader :size

  def [](x, y)
    raise IndexError unless valid_indexes?(x, y)

    ground[x][y]
  end

  def each_point
    ground.each_with_index do |line, x|
      line.each_with_index do |point, y|
        yield(x, y, point)
      end
    end
  end

  def map
    memo = []

    ground.each_with_index do |line, x|
      line.each_with_index do |point, y|
        memo << yield(x, y, point)
      end
    end

    memo
  end

  private

  def fetch_size_from_ground(ground)
    {
      lat: ground.size,
      long: ground.first&.size || 0,
    }
  end

  def valid_indexes?(x, y)
    (x >=0 && x < size[:lat]) && (y >=0 && y < size[:long])
  end
end
