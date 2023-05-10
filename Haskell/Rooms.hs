module Rooms where

import Text.Read (readMaybe)

data Room = Elevator | Openspace | Kitchen | Bathroom deriving Eq

-- in case of need to print the name of the room
instance Show Room where
  show Elevator = "elevator"
  show Openspace = "openspace"
  show Kitchen = "kitchen"

-- mapping name of the room to the room (useful in reading user input)
instance Read Room where
    readsPrec _ "kitchen" = [(Kitchen, "")]
    readsPrec _ "openspace" = [(Openspace, "")]
    readsPrec _ "bathroom" = [(Bathroom, "")]

    readsPrec _ _ = []

-- Define a function to check whether there is a path between two locations
path :: Room -> Room -> IO Bool
path Elevator Openspace = return True
path Openspace Elevator = return True
path Kitchen Openspace = return True
path Openspace Kitchen = return True
path Kitchen Bathroom = return True
path Bathroom Kitchen = return True
path _ _ = return False


getDirectionFromArgs :: [String] -> Maybe Room
getDirectionFromArgs (a : _) = readMaybe a
getDirectionFromArgs _ = Nothing

