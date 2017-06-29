import Foundation

class SCWordList {
    fileprivate static let list = ["Africa", "Agent", "Air", "Airplane", "Aisle", "Alien", "Alligator", "Amazon", "America", "Angel", "Ankle", "Apple", "Arm", "Asleep", "Asteroid", "Astronaut", "Athlete", "Atlantis", "Aunt", "Australia", "Avocado", "Back", "Bag", "Baguette", "Bald", "Ball", "Balloon", "Banana", "Band", "Bank", "Bar", "Bark", "Baseball", "Basketball", "Bat", "Battery", "Beach", "Beanstalk", "Bear", "Beat", "Bed", "Bee", "Beer", "Beijing", "Belt", "Berlin", "Berry", "Bib", "Bicycle", "Big", "Bike", "Bill", "Billboard", "Bird", "Birthday", "Bite", "Black", "Blanket", "Block", "Blossom", "Blue", "Blur", "Board", "Boat", "Bobsled", "Body", "Bolt", "Bomb", "Book", "Boot", "Booth", "Bottle", "Bowtie", "Box", "Boy", "Brand", "Brave", "Brick", "Bride", "Bridge", "Broccoli", "Broom", "Brown", "Brush", "Bubble", "Buddy", "Buffalo", "Bug", "Bulb", "Bunny", "Bus", "Button", "Buy", "Cabin", "Cake", "Campsite", "Can", "Canada", "Candle", "Candy", "Cape", "Car", "Card", "Cardboard", "Carrot", "Casino", "Cat", "Ceiling", "Cell", "Century", "Chair", "Chalk", "Champion", "Charge", "Chef", "Chess", "Chest", "Chick", "Chicken", "Chime", "China", "Chocolate", "Church", "Circus", "Clay", "Cliff", "Climb", "Cloak", "Clock", "Clown", "Club", "Clue", "Coach", "Coal", "Coaster", "Code", "Cold", "College", "Comet", "Comfort", "Comic", "Computer", "Concert", "Conductor", "Cone", "Cook", "Coop", "Cord", "Cough", "Court", "Cow", "Cowboy", "Crayon", "Cream", "Cricket", "Crisp", "Cross", "Crow", "Crown", "Cruise", "Crumb", "Crust", "Cuff", "Curtain", "Cycle", "Dad", "Dance", "Dart", "Date", "Dawn", "Day", "Deck", "Deep", "Degree", "Dent", "Dentist", "Desk", "Diamond", "Dice", "Dictionary", "Dimple", "Dinosaur", "Dirty", "Ditch", "Diver", "Doctor", "Dog", "Doghouse", "Doll", "Dominoes", "Door", "Dot", "Draft", "Dragon", "Drain", "Draw", "Dream", "Dress", "Drill", "Drink", "Drip", "Drums", "Dryer", "Dubai", "Duck", "Dump", "Dunk", "Dust", "Eagle", "Ear", "Ears", "Earth", "Eat", "Egypt", "Elbow", "Electricity", "Elephant", "Elevator", "Elf", "Elm", "Engine", "England", "Escalator", "Europe", "Eye", "Eyebrow", "Face", "Fair", "Fan", "Fancy", "Fast", "Feast", "Fence", "Fiddle", "Field", "File", "Film", "Finger", "Fire", "First", "Fish", "Fix", "Flag", "Flashlight", "Flock", "Flower", "Flu", "Flush", "Fly", "Fog", "Foil", "Foot", "Football", "Forehead", "Forest", "Forever", "Fountain", "France", "Freckle", "Freight", "Frog", "Frown", "Gallop", "Game", "Garbage", "Garden", "Gas", "Gasoline", "Gem", "Genius", "Germany", "Ghost", "Giant", "Ginger", "Gingerbread", "Girl", "Glass", "Glasses", "Glove", "Goblin", "Gold", "Goodbye", "Grandpa", "Grape", "Grass", "Gray", "Greece", "Green", "Ground", "Guitar", "Gum", "Gumball", "Hair", "Half", "Ham", "Handle", "Handwriting", "Hang", "Happy", "Hat", "Hatch", "Haunted", "Hawk", "Head", "Heart", "Hedge", "Helicopter", "Hide", "Hill", "Hockey", "Hole", "Hollywood", "Homework", "Honey", "Hong Kong", "Honk", "Hook", "Horse", "Hose", "Hospital", "Hot", "Hotel", "House", "Hug", "Hungry", "Hurdle", "Hurt", "Hut", "Ice", "Ice Cream", "India", "Inn", "Intern", "Internet", "Ivory", "Ivy", "Jade", "Japan", "Jeans", "Jelly", "Jet", "Jog", "Journal", "Jump", "Jupiter", "Kangaroo", "Ketchup", "Key", "Kilogram", "King", "Kitchen", "Kite", "Kiwi", "Knee", "Knife", "Knight", "Koala", "Lab", "Lace", "Ladder", "Ladybug", "Lag", "Landfill", "Lap", "Laser", "Laugh", "Laundry", "Law", "Lawn", "Lawyer", "Leak", "Leg", "Lemon", "Letter", "Level", "Life", "Lifestyle", "Light", "Lightsaber", "Lime", "Limousine", "Line", "Link", "Lion", "Lizard", "Log", "Lollipop", "London", "Los Angeles", "Loyalty", "Luck", "Lunch", "Lunchbox", "Lyrics", "Macau", "Machine", "Mail", "Mailbox", "Mammoth", "Maple", "Marble", "March", "Mark", "Mars", "Mascot", "Match", "Matchstick", "Mate", "Mattress", "Mercury", "Mess", "Mexico", "Mine", "Mint", "Mistake", "Modern", "Mold", "Mole", "Mom", "Monday", "Money", "Monitor", "Monster", "Moon", "Mop", "Moth", "Motorcycle", "Mountain", "Mouse", "Mouth", "Mud", "Music", "Mute", "Nail", "Nature", "Needle", "Neighbor", "Neptune", "Nest", "New York", "Niece", "Night", "Nightmare", "Ninja", "Nose", "Note", "Nut", "Oar", "Ocean", "Octopus", "Office", "Oil", "Old", "Olive", "Olympian", "Opera", "Orange", "Orbit", "Organ", "Outside", "Paint", "Pajamas", "Palace", "Pan", "Pants", "Paper", "Parachute", "Paris", "Park", "Parody", "Part", "Party", "Pass", "Password", "Pastry", "Pawn", "Pear", "Pen", "Pencil", "Penguin", "Penny", "Pepper", "Phoenix", "Phone", "Photograph", "Piano", "Picnic", "Pillow", "Pilot", "Pin", "Ping", "Pinwheel", "Pipe", "Pirate", "Pistol", "Pit", "Plan", "Plane", "Plastic", "Plate", "Platypus", "Play", "Playground", "Plot", "Plow", "Plumber", "Pluto", "Pocket", "Poem", "Point", "Poison", "Pole", "Police", "Pomp", "Pong", "Pool", "Popsicle", "Port", "Positive", "Post", "Pound", "Present", "President", "Princess", "Punk", "Puppet", "Puppy", "Purple", "Push", "Puzzle", "Pyramid", "Queen", "Quicksand", "Quiet", "Rabbit", "Race", "Racket", "Radio", "Raft", "Rag", "Rainbow", "Rainwater", "Random", "Ray", "Recycle", "Red", "Regret", "Rib", "Riddle", "Rim", "Ring", "Rink", "Robot", "Rock", "Rome", "Room", "Root", "Rose", "Roulette", "Round", "Row", "Ruler", "Runt", "Sad", "Safe", "Salmon", "Salt", "San Francisco", "Sandbox", "Sandcastle", "Sandwich", "Satellite", "Saturn", "Scar", "Scared", "School", "Scientist", "Scorpion", "Scramble", "Screen", "Scuff", "Sea", "Seal", "Seashell", "Season", "Sentence", "Server", "Set", "Shadow", "Shallow", "Shampoo", "Shanghai", "Shark", "Sheep", "Sheets", "Sheriff", "Ship", "Shipwreck", "Shirt", "Shoe", "Shoelace", "Shop", "Short", "Shower", "Sick", "Silhouette", "Singer", "Sink", "Sip", "Skate", "Skating", "Ski", "Skyscraper", "Slam", "Sleep", "Sling", "Slow", "Slump", "Smith", "Sneeze", "Snow", "Snuggle", "Soccer", "Sock", "Soldier", "Song", "Space", "Spain", "Spare", "Speakers", "Spell", "Spider", "Spit", "Sponge", "Spool", "Spoon", "Spot", "Spring", "Sprinkler", "Spy", "Square", "Squint", "Stadium", "Stairs", "Stand", "Star", "State", "Stick", "Stock", "Stop", "Stove", "Straw", "Stream", "String", "Stripe", "Student", "Sub", "Suit", "Sun", "Sunburn", "Superhero", "Sushi", "Swamp", "Swarm", "Sweater", "Swimming", "Swing", "Sydney", "Table", "Tablet", "Tag", "Tail", "Talk", "Tap", "Taxi", "Teacher", "Teapot", "Teenager", "Telephone", "Telescope", "Television", "Ten", "Tennis", "Theater", "Thief", "Think", "Throne", "Thumb", "Thunder", "Tide", "Tie", "Tiger", "Time", "Tire", "Tissue", "Toast", "Toilet", "Tokyo", "Tool", "Toothbrush", "Torch", "Tornado", "Toronto", "Tower", "Track", "Tractor", "Train", "Trash", "Treasure", "Tree", "Triangle", "Trip", "Truck", "Tub", "Tuba", "Tube", "Tutor", "Twig", "Type", "Underwear", "Unicorn", "Universe", "University", "Uranus", "Vacuum", "Van", "Vancouver", "Venus", "Vest", "Violet", "Violin", "Vision", "Wake", "Wall", "War", "Wasp", "Watch", "Water", "Watermelon", "Wave", "Wax", "Web", "Wedding", "Weed", "Well", "Whale", "Wheelchair", "Whip", "Whiskey", "Whistle", "White", "Wig", "Wind", "Windmill", "Wine", "Winter", "Witch", "Wolf", "Wool", "World", "Worm", "Yard", "Yardstick", "Young", "Zamboni", "Zen", "Zero", "Zipper", "Zone", "Zoo"]

    static func getShuffledWords() -> [String] {
        return self.list.choose(SCConstants.constant.cardCount.rawValue)
    }
}
