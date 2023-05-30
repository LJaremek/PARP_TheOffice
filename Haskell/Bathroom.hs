module Bathroom where

import Control.Monad

import ReadCommand
import Go

import Game
import Rooms

data LocalDwightQuestState = LocalDwightQuestState { isTask0Correct :: Bool
                                                   , isTask1Correct :: Bool
                                                   , isTask2Correct :: Bool
                                                   , isTask3Correct :: Bool
                                                   , isDoorDestroyed :: Bool
                                                   }

describe :: DwightQuest -> IO ()
describe dwightQuest = do
  if dwightQuest == DwightQuestNotStarted
    then do
      putStrLn "You stop in front of the bathroom door. You place your hand on the door handle..."
      putStrLn "...and suddenly you hear furious German swearing words coming from the inside."
      putStrLn "HINT: knock or go kitchen"
    else do
      putStrLn "Some toilets, sinks, and rather unhealthy smell. The toilet paper seems to be missing as usual. Nothing too interesting here."
      putStrLn "You can go back to the 'kitchen' from here"

doDwightQuest :: Game -> IO Game
doDwightQuest (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) = do
  if iamAt /= Bathroom
    then return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
  else if dwightQuest /= DwightQuestNotStarted then do
    putStrLn "It seems there is no one in the bathroom"
    return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
  else do
    displayDwightInitialDialogue
    startQuest <- decideWhetherToStartDwightQuest
    if startQuest
      then do
        displayDwightQuestOpening
        let localState = LocalDwightQuestState { isTask0Correct = False
                                               , isTask1Correct = False
                                               , isTask2Correct = False
                                               , isTask3Correct = False
                                               , isDoorDestroyed = False
                                               }
        isDoorDestroyed <- doDwightTasks localState
        let newInventory = inventory ++ [DwightReference]
        if isDoorDestroyed
          then do
            return (Game iamAt saidHi jimQuest creedQuest DwightQuestDoneHalf newInventory)
          else do
            return (Game iamAt saidHi jimQuest creedQuest DwightQuestDoneFull newInventory)
      else do
        newGame <- go (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) Kitchen
        return newGame


decideWhetherToStartDwightQuest = do
  cmd <- readCommand
  let splitCmd = words cmd
  if null splitCmd
    then do
      decideWhetherToStartDwightQuest
    else do
      let cmdName = head splitCmd
      if cmdName == "1" || cmdName == "1."
        then return True
      else if cmdName == "2" || cmdName == "2."
        then return False
      else decideWhetherToStartDwightQuest

doDwightTasks localState = do
  localState <- task0 localState
  localState <- task1 localState
  localState <- task2 localState
  (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed) <- task3 localState
  if (isDoorDestroyed) then do
    displayDwightFinalDialogueDoorDestroyed
    return isDoorDestroyed
  else if (isTask0Correct && isTask1Correct && isTask2Correct && isTask3Correct) then do
    displayDwightFinalDialogueDoorNotDestroyed
    return isDoorDestroyed
  else do
    displayDwightDialogueCodeNotCorrect
    doDwightTasks (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)


task0 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed) = do
  putStrLn ""
  putStrLn "Find the next element: 1, 2, 4, 8, 16, ..."
  putStrLn "OR: Type 'kick' to kick off the door (Michael is not going to be happy about it...) "
  putStrLn ""
  cmd <- readCommand
  let splitCmd = words cmd
  if null splitCmd
    then do
      task0 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
    else do
      let cmdName = head splitCmd
      case cmdName of
        "32" -> do
          return (LocalDwightQuestState True isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
        "kick" -> do
          return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct True)
        _ -> do
          return (LocalDwightQuestState False isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)

task1 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed) = do
  if isDoorDestroyed
    then do
      return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
    else do
      putStrLn ""
      putStrLn "Find the next element: 1, 1, 2, 3, 5, 8, ..."
      putStrLn "OR: Type 'kick' to kick off the door (Michael is not going to be happy about it...) "
      putStrLn ""
      cmd <- readCommand
      let splitCmd = words cmd
      if null splitCmd
        then do
          task1 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
        else do
          let cmdName = head splitCmd
          case cmdName of
            "13" -> do
              return (LocalDwightQuestState isTask0Correct True isTask2Correct isTask3Correct isDoorDestroyed)
            "kick" -> do
              return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct True)
            _ -> do
              return (LocalDwightQuestState isTask0Correct False isTask2Correct isTask3Correct isDoorDestroyed)

task2 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed) = do
  if isDoorDestroyed
    then do
      return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
    else do
      putStrLn ""
      putStrLn "Find the next element: 1, 4, 9, 16, 25, ..."
      putStrLn "OR: Type 'kick' to kick off the door (Michael is not going to be happy about it...) "
      putStrLn ""
      cmd <- readCommand
      let splitCmd = words cmd
      if null splitCmd
        then do
          task2 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
        else do
          let cmdName = head splitCmd
          case cmdName of
            "36" -> do
              return (LocalDwightQuestState isTask0Correct isTask1Correct True isTask3Correct isDoorDestroyed)
            "kick" -> do
              return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct True)
            _ -> do
              return (LocalDwightQuestState isTask0Correct isTask1Correct False isTask3Correct isDoorDestroyed)

task3 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed) = do
  if isDoorDestroyed
    then do
      return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
    else do
      putStrLn ""
      putStrLn "Find the next element: 1, 32, 81, 64, 25, ..."
      putStrLn "OR: Type 'kick' to kick off the door (Michael is not going to be happy about it...) "
      putStrLn ""
      cmd <- readCommand
      let splitCmd = words cmd
      if null splitCmd
        then do
          task3 (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct isDoorDestroyed)
        else do
          let cmdName = head splitCmd
          case cmdName of
            "6" -> do
              return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct True isDoorDestroyed)
            "kick" -> do
              return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct isTask3Correct True)
            _ -> do
              return (LocalDwightQuestState isTask0Correct isTask1Correct isTask2Correct False isDoorDestroyed)

displayDwightInitialDialogue = do
  putStrLn ""
  putStrLn "Dwight (from the inside): Hey, wait! Temp, is that you? You have to help me. I've been locked inside."
  putStrLn "Dwight: If you help me and tell nothing to Jim I will give you my recommendation."
  putStrLn "You: How on Earth are you locked inside?"
  putStrLn "Dwight: I have forgotten that I had recently changed code to my padlock..."
  putStrLn "You: Do you always lock yourself in a bathroom with a padlock?"
  putStrLn "Dwight: Of course, Temp. I value my privacy, I always have my military padlock with digit code."
  putStrLn "Dwight: For security reasons I change the code every month... Temp, you have to help me!"
  putStrLn ""
  putStrLn "Enter the number of dialogue option:"
  putStrLn "1. Ok, I will help you now. (start quest)"
  putStrLn "2. Oh, I have left the oven turned on... be right back! (leave Dwight inside)"
  putStrLn ""

displayDwightQuestOpening = do
  putStrLn ""
  putStrLn "You: Do you have your new code saved somewhere?"
  putStrLn "Dwight: No, are you stupid, Temp? I never write down any code. I have e n c r y p t e d it."
  putStrLn "You: So why don't you d e c r y p t it?"
  putStrLn "Dwight: Because I have forgotten how I encrypted it... I have my notes here, though."
  putStrLn "Dwight: I will tell you first numbers of a sequence, and you have to find the next element. This is going to be a part of the code."

displayDwightFinalDialogueDoorDestroyed = do
  putStrLn ""
  putStrLn "You take a deep breath and... CLANG!!!"
  putStrLn "The door lies on the floor broken in two parts. There is no way anyone can repair it, but Dwight is free."
  putStrLn "Dwight: Well... not what I expected, but thanks. Here is my reference for you, as promised. It will be useful to have you on board."
  putStrLn "Dwight: However, keep in mind that Michael likes to hide in a bathroom when his supervisor comes... he's not going to like what happend to the door."
  putStrLn ""

displayDwightFinalDialogueDoorNotDestroyed = do
  putStrLn ""
  putStrLn "You hear some clicking and cracking and, to your surprise, the bathroom door opens and you see Dwight coming out from the bathroom"
  putStrLn "Dwight: Did I forget the code for real? FALSE. I was just checking whether you have basic math skills, Temp."
  putStrLn "Dwight: Here you have my reference, but don't imagine that you have proved yourself useful."
  putStrLn "Dwight gives you a sheet of paper with his signature and then moves to his desk in openspace. The bathroom is open now."
  putStrLn ""

displayDwightDialogueCodeNotCorrect = do
  putStrLn ""
  putStrLn "Dwight: It seems it didn't work... Let's try another time."
  putStrLn ""