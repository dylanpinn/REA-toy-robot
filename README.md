# Toy Robot

Ruby CLI program that implements a Toy Robot on a 5x5 tabletop.

## Requirements

- `ruby` (tested using 2.6.5)

## Instructions

To run the program simply run:

```bash
ruby ./toy_robot.rb
```

This will open a prompt, simply enter commands one at a time.

## Testing

To run the test suite the dependencies will need to be installed

```bash
bundle install
```

### Unit Tests

These can be run by running:

```bash
bundle exec rake
```

### Integration Tests

The integration specs can be be run with:

```bash
bundle exec rspec spec/integration_spec.rb
```

## Implementation Notes

### Robot Class

This contains the logic for controlling the robot.

- Move
  - This will need to check if the move is valid and if so
    move the robot 1 place in the direction it is facing.
- Left
  - This will update the direction that the robot is facing (90 degrees left).
- Right
  - This will update the direction that the robot is facing (90 degrees right).
- Report
  - This will report the position of the robot on the board.
- Place
  - This will place the robot onto a tabletop.

### Tabletop Class

This contains the logic for representing the Tabletop, it has dimensions and
checks if a position is valid.

### CLI Class

This will contain the logic for accepting commands from the CLI and relaying
them to either the robot or tabletop. It will also need to check if the
commands are correct.
