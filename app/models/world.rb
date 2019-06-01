class World
  attr_reader :ground

  def initialize(ground)
    @ground = ground
  end

  # def to_json
  #   { ground: ground.data }.to_json
  # end

  # def each_point
  #   ground.each_with_index do |line, x|
  #     line.each_with_index do |point, y|
  #       yield(x, y, point)
  #     end
  #   end
  # end

  # def each_point_on_range(xx, yy)
  #   ground[xx].each_with_index do |line, x|
  #     line[yy].each_with_index do |point, y|
  #       yield(x, y, point)
  #     end
  #   end
  # end
end
