# Toy Robot Simulator

## Specification
The specification document can be found [here](docs/code_test_robot.pdf)

## Requirements
* ruby 2.3.0

## Setup
* Install bundler: ```gem install bundler```.
* Install require gems ```bundle install```

## Usage

Run the following command to simulate commands in the given file:
```ruby bin/toy_robot.rb <path to file>```

For some examples, look in ```spec/fixtures```

## Testing
Tests are written in rspec and are located in ./spec and can be ran with ```bundle exec rspec spec```


## Discussion
At a high level, this solution basis of this solution is a simulator class initializes a Robot, TableTop and
a command factory. The Command Factory uses the strategy pattern to select the the appropriate command class
and then execute the commands instruction set on the robot, using the passed in world as a reference for
directions and boundries.

The Command structure uses the an Abstract class (in theory, ruby will still initalize it just fine). Whilst
this is sometimes frowned upon, I have found that adoptting this pattern occasionally help communicate the
expected interface. Regarding the commands themselves, I have elected to include the instruction calculations
inside them rather than in the Robot. There is an argument for moving them into the robot itself as it gerenally
will involve the Robot's state, however I feel that the interactions with the table top make this a little fuzzy.
Alternatively, the robot could be initialized with a table top instance but in my mind this might be giving the
robot too much information.

I also turn Directions and Coordinates into classes and I'm sort of on the fence about this. On one hand
these do appear to be data objects which isn't great. On the other hand, it does ensure that it will not
silently fail should the developer pass an unknown message to it. For example:

```ruby

direction = { name: 'WEST', x_move: -1 , y_move: 0 }

direction[:namme] # nil

```

vs


```ruby

direction = Direction.new(name: 'WEST', x_move: -1 , y_move: 0)

direction.namme # <NoMethodError>

```

It also allows me to create meaningful NullObjects when intializing the robot (Direction object vs random hash}.
Which I think improves readbility.

At this point it is probably worth noting that I use ```attr_readers``` and ```attr_writers``` over instance variables
when dealing with private attributes. This is for the same reason as the direction/coordinates classses, they will return
no method errors when if they are misspelt verses returning nil.

Finially, I wanted to quickly cover an alternative solution I considered and rejected. I considered intializing the TableTop
with a network of positions, where each position would know who it's neighbours were making the move command fairly trival.
The reason I rejected this is for two reasons. Firstly, it will most likely initialize objects which are never used (unless
the robot traverses the entire tabletop). Secondly, it becomes less scalable the more directions you support (each position
has more neighbours to keep track of).

