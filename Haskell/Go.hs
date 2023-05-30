module Go where

import Data.Maybe

import Game
import Rooms

go :: Game -> Room -> IO Game
go (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) room = do
  let here = iamAt
  if here == room
    then do
      putStrLn ""
      putStrLn "You are already there."
      return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
    else do
      can_go <- path here room
      if can_go
        then do
--          let newIamAt = room
          let newGame = (Game room saidHi jimQuest creedQuest dwightQuest inventory)
          return newGame
        else do
          putStrLn ""
          putStrLn "There is no path to that place."
          return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)

tryGo :: Game -> [String] -> IO Game
tryGo (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) args =
  if isJust (getDirectionFromArgs args)
    then do
      let room = fromJust (getDirectionFromArgs args)
      newGame <- go (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) room
      return newGame
  else do
    return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
