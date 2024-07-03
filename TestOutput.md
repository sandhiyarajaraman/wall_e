# Test cases 
Exploring how our toy robot behaves in various scenarios, with screenshots of console output.

[<- Go back to Readme.md](README.md)

### Scenario 1:

The robot is not placed on the table, but we run other commands.

<ins>Output:</ins> User sees an error message - `Robot is not placed on the table`

![Scenario 1 result](./screenshots/Wall-E-1.png)

### Scenario 2: 

The robot is placed on the table, moved and expected to report its position

```
PLACE 0,0,NORTH
MOVE
REPORT
```

<ins>Output:</ins> `Position => X: 0, Y: 1, Facing: NORTH`

![Scenario 2 result](./screenshots/Wall-E-2.png)

### Scenario 3: 

The robot is placed on the table, turned left and expected to report its position

```
PLACE 0,0,NORTH
LEFT
REPORT
```

<ins>Output:</ins> `Position => X: 0, Y: 0, Facing: WEST`

![Scenario 3 result](./screenshots/Wall-E-3.png)

### Scenario 4: 

The robot is placed on the table, moved twice, turned left, moved again and expected to report its position

```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```

<ins>Output:</ins> `Position => X: 3, Y: 3, Facing: NORTH`

![Scenario 4 result](./screenshots/Wall-E-4.png)

### Scenario 5: 

The robot is placed at the east edge of the table, facing east. Then we try to move it. Now the robot will say `it cannot move` as it will fall off the table.

```
PLACE 4,4,EAST
REPORT
MOVE
```

<ins>Output:</ins> `MOVE not allowed. Robot will fall off the table.`

![Scenario 5 result](./screenshots/Wall-E-5.png)