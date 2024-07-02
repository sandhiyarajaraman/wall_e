# A Toy Robot (named Wall-E) - by [Sandhiya Rajaraman](https://www.linkedin.com/in/sandhiyar/)

The application is a simulation of a toy robot moving on a square tabletop. This is a ruby command line application. 

### Table of contents:

* [Built using](./README.md#built-using)
* [Run the project](./README.md#run-the-project)
* [Run the tests](./README.md#run-the-tests)
* [Notes on Implementation](./README.md#notes-on-implementation)
* [Scope for enhancements](./README.md#scope-for-enhancements)
* [Sample output](./README.md#sample-output)

### Additional resource links:

* [Complete problem statement](ProblemStatement.md)
* [Test output with screenshots](TestOutput.md)

### Built using:

- Ruby (3.3.3)
- [Interactor Gem](https://github.com/collectiveidea/interactor)
- [Shoppify's CLI-UI gem](https://github.com/Shopify/cli-ui) - to add color to command line output
- Rspec
- Rubocop
- Rubocop-rspec

### Run the project

Clone the repository from Git:

```bash
git clone https://github.com/sandhiyarajaraman/wall_e.git
```

Navigate to the `wall_e` folder.
```bash
cd wall_e
```

From inside the folder run

```bash
bundle install
```

Next, to start the application, run (from inside the `wall_e` folder):

```bash
ruby ./lib/main.rb
```

### Run the tests:
```bash
bundle exec rspec spec
```

### Notes on Implementation

- This toy robot application uses the Interactor pattern. The following text is quoted from a blog on the internet that summarises the Interactor pattern. 

> In scenarios where we need to extract the business logic of a specific use case into an object, traditional service objects may not offer all the necessary functionalities. This is where the Rails Interactors gem comes into play. Interactors build upon the concept of service objects and provide additional features to enhance overall functionality and improve code organization.

> The Rails Interactors gem offers a structured approach to handling complex use cases by breaking them down into smaller, more manageable components. These components, known as interactors, encapsulate the business logic of a particular use case. Interactors enable better separation of concerns, enhance code reusability, and improve testability.

- In our use case, each `command` issued to the robot is an `interaction`. Assuming the universe contains a Table and a Robot (1st class objects), the user interacts with the universe by issuing commands.

- Before executing each command, the interactor needs to have context of the universe. Hence we pass `table:, robot:` objects to each interactor.

- Since the interactor receives context of the universe (eg: table, robot, place coordinates, facing direction), it can simply focus on the business logic needed to execute the command.

- Example: MOVE command:
  - The Table model is responsible for knowing the boundary coordinates.
  - The Robot model is responsible for knowing its own position (coordinates and facing direction)
  - The `MOVE` command will:
    - `ask` the Robot for its potential next coordinates
    - `ask` the Table if those coordinates are within boundary or not
    - `decide` if the robot should move or not
    - `move` the robot `or return an error` saying it cannot move


### Scope for enhancements

- If we choose to add multiple robots on the same table, we only need to tweak some Interactors (MOVE, PLACE, REPORT), to take an array of robots as context parameters, with the current robot being identified uniquely. Then multiple users (robots) can play on the same table.

- Now in the current implementation, multiple users can play in separate instances.

- The table size can be custom defined and redefined. It need not always be a square.

- The robot can be encouraged to turn in more than just the 4 cardinal directions. North-East, South-West, South-East, North-West moves can be incorporated with diagonal moves.

- Reverse movement can also be introduced.

- All commands can be made case insensitive.


### Sample output

![Sample screenshot](screenshots/Wall-E-4.png)