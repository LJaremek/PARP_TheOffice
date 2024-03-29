module Rooms where

import Text.Read (readMaybe)

data Room = Elevator | Openspace | Kitchen | Bathroom | ConferenceRoom | MichaelRoom | DwightDesk | CreedDesk | BreakRoom deriving Eq

instance Show Room where
  show Elevator = "elevator"
  show Openspace = "openspace"
  show Kitchen = "kitchen"
  show Bathroom = "bathroom"
  show ConferenceRoom = "conference_room"
  show MichaelRoom = "michael_room"
  show DwightDesk = "dwight_desk"
  show CreedDesk = "creed_desk"
  show BreakRoom = "break_room"

instance Read Room where
    readsPrec _ "openspace" = [(Openspace, "")]
    readsPrec _ "kitchen" = [(Kitchen, "")]
    readsPrec _ "bathroom" = [(Bathroom, "")]
    readsPrec _ "conference_room" = [(ConferenceRoom, "")]
    readsPrec _ "michael_room" = [(MichaelRoom, "")]
    readsPrec _ "dwight_desk" = [(DwightDesk, "")]
    readsPrec _ "creed_desk" = [(CreedDesk, "")]
    readsPrec _ "break_room" = [(BreakRoom, "")]

    readsPrec _ _ = []

path :: Room -> Room -> IO Bool
path Elevator Openspace = return True
path Openspace Elevator = return True

path Openspace ConferenceRoom = return True
path ConferenceRoom Openspace = return True

path Openspace MichaelRoom = return True
path MichaelRoom Openspace = return True

path Openspace DwightDesk = return True
path DwightDesk Openspace = return True

path Openspace CreedDesk = return True
path CreedDesk Openspace = return True

path Kitchen Openspace = return True
path Openspace Kitchen = return True

path Kitchen Bathroom = return True
path Bathroom Kitchen = return True

path Kitchen BreakRoom = return True
path BreakRoom Kitchen = return True

path _ _ = return False


getDirectionFromArgs :: [String] -> Maybe Room
getDirectionFromArgs (a : _) = readMaybe a
getDirectionFromArgs _ = Nothing
