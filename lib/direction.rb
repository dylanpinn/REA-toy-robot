# frozen_string_literal: true

# Which direction the Robot is facing.
class Direction
  X_MOVE = 0
  Y_MOVE = 0

  def self.to_s
    name.upcase
  end
end

# Robot is facing north.
class North < Direction
  Y_MOVE = 1
end

# Robot is facing south.
class South < Direction
  Y_MOVE = -1
end

# Robot is facing east.
class East < Direction
  X_MOVE = 1
end

# Robot is facing west.
class West < Direction
  X_MOVE = -1
end
