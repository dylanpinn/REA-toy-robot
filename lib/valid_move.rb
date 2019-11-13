# frozen_string_literal: true

# Check if a move is valid.
class ValidMove
  def self.within_upper_bounds?(coordinate, bound)
    coordinate < bound - 1
  end

  def self.within_lower_bounds?(coordinate)
    coordinate.positive?
  end
end
