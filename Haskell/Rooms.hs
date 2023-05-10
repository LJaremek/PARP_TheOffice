module Rooms where

data Room = Elevator | Openspace deriving Eq

instance Show Room where
  show Elevator = "elevator"
  show Openspace = "openspace"

-- Define a function to check whether there is a path between two locations
path :: Room -> Room -> IO Bool
path Elevator Openspace = return True
path Openspace Elevator = return True
path _ _ = return False


-- Define a function to print a description of a location
describe :: Room -> IO ()
describe Elevator = do
  putStrLn "You step into the elevator and when the doors are closing Michael (your boss) rushes inside."
  putStrLn ""
  putStrLn "Michael: Hi, you must be our new intern, welcome to Dunder Mifflin!"
  putStrLn "(HINT: type 'hi.' to say hi)"
describe Openspace = do
  putStrLn "You are in the openspace"
  putStrLn "You can go to the 'kitchen', 'dwight_desk', 'creed_desk' and 'michael_room' from here"
