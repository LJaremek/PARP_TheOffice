module Bathroom where

import Game
import Rooms

describe :: DwightQuest -> IO ()
describe dwightQuest = do
  if dwightQuest == DwightQuestNotStarted
    then do
      putStrLn "You stop in front of the bathroom door. You place your hand on the door handle..."
      putStrLn "...and suddenly you hear furious German swearing words coming from the inside."
      putStrLn "HINT: knock or go kitchen"
    else do
      putStrLn "Some toilets, sinks, and rather unhealthy smell. The toilet paper seems to be missing as ususal. Nothing too interesting here."
      putStrLn "You can go back to the 'kitchen' from here"

doDwightQuest :: Game -> IO Game
doDwightQuest (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
  if iamAt /= Bathroom
    then return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
  else if dwightQuest == DwightQuestNotStarted
    then do
      display_dwight_initial_dialogue
      return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
  else do
    putStrLn "It seems there is no one in the bathroom"
    return (Game iamAt saidHi jimQuest creedQuest dwightQuest)

display_dwight_initial_dialogue = do
  putStrLn "Dwight (from the inside): Hey, wait! Temp, is that you? You have to help me. I've been locked inside."
  putStrLn "Dwight: If you help me and tell nothing to Jim I will give you my recommendation."
  putStrLn "You: How on Earth are you locked inside?"
  putStrLn "Dwight: I have forgotten that I had recently changed code to my padlock..."
  putStrLn "You: Do you always lock yourself in a bathroom with a padlock?"
  putStrLn "Dwight: Of course, Temp. I value my privacy, I always have my military padlock with digit code."
  putStrLn "Dwight: For security reasons I change the code every month... Temp, you have to help me!"
  putStrLn ""