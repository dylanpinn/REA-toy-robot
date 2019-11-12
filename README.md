# Toy Robot

Ruby CLI program that implements a Toy Robot on a 5x5 tabletop.

## Requirements

- `ruby` (tested using 2.6.5)

## Setup

TODO if any.

## Testing

### Unit Tests

These can be run by running:

```bash
bundle exec rake
```

### Integration Tests

TODO

## Implementation Notes

### Robot Class

This contains the logic for controlling the robot.

- Move
  - This will need to check with the tabletop if the move is valid and if so
    move the robot (through the tabletop).
- Left
  - This will update the direction that the robot is facing (90 degrees left).
- Right
  - This will update the direction that the robot is facing (90 degrees right).
- Report
  - This will report the position of the robot on the board.

### Tabletop Class

This contains the logic for where the robot is on the tabletop. This will
advise the robot if a move is possible.

- Place (robot)
  - Can be repeated.

### CLI Class

This will contain the logic for accepting commands from the CLI and relaying
them to either the robot or tabletop. It will also need to check if the
commands are correct.

## THINGS TO CONSIDER

1. Has the robot been placed on the board?
2. Is the move valid? Robot not going to fall off the board.
3. Run test cases from CLI (pipe a txt command file).
4. Future enhancements (these should be easily possible):
    - Change size of the tabletop.
    - Add a second robot.
    - Place robot on another board.
