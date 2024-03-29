module Look where

import Game
import Rooms
import Elevator
import Openspace
import Kitchen
import Bathroom
import ConferenceRoom
import MichaelRoom
import DwightDesk
import CreedDesk
import BreakRoom

look :: Game -> IO ()
look (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) = do
  let place = iamAt
  putStrLn ""
  case place of
    Elevator -> do
      Elevator.describe
    Openspace -> do
      Openspace.describe
    Kitchen -> do
      Kitchen.describe jimQuest -- description depends on the state of Jim Quest
    Bathroom -> do
      Bathroom.describe dwightQuest -- description depends on the state of Dwight Quest
    ConferenceRoom -> do
      ConferenceRoom.describe
    MichaelRoom -> do
      MichaelRoom.describe jimQuest creedQuest dwightQuest -- description depends
    DwightDesk -> do
      DwightDesk.describe
    CreedDesk -> do
      CreedDesk.describe
    BreakRoom -> do
      BreakRoom.describe
  putStrLn ""