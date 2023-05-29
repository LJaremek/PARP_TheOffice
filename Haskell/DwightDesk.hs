module DwightDesk where

import Text.Read (readMaybe)

import Game
import Rooms

describe :: IO ()
describe = do
    putStrLn "You are near the Dwight desk"
    putStrLn "You can go to the 'openspace' from here"
    putStrLn "Type 'lookAround' to check the desk"


checkDwightDesk :: Game -> IO Game
checkDwightDesk (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
    if (iamAt /= DwightDesk)
    then do
        return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    else do

    if (jimQuest == StaplerInDesk)
        then do
            putStrLn "Jim told me to prank Dwight."
            putStrLn "You see his desk with the drawer closed with a four-digit lock."
            putStrLn "Maybe can I breake the code?. There should be something!"
            putStrLn "HINT: 'break_code'"
            return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    else if (jimQuest == StaplerOutClear)
        then do
            putStrLn "I have the stapler in my hands."
            putStrLn "I have to go to the kitchen and put it to the jelly!"
            return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    else if (jimQuest == StaplerOutJelly)
        then do
            putStrLn "I have the stapler in a jelly in my hands."
            putStrLn "I have to put it back to the drawer!"
            putStrLn "HINT 'put_jelly_stapler'"
            return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    else do  -- StaplerInJelly
        putStrLn "The jelly stapler is in the Dwight desk drawer. Good job!"
        putStrLn "Jim gave me his reference."
        putStrLn "Michael will be proud of me when he sees this!"
        return (Game iamAt saidHi jimQuest creedQuest dwightQuest)


breakDwightCode :: Game -> IO Game
breakDwightCode (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
    if ((iamAt /= DwightDesk) && (jimQuest /= StaplerInDesk))
    then do
        return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    else do

    putStrLn "Type the code: "
    input <- getLine
    let number = read input :: Int
    if (number > 4510)
        then do
            putStrLn "It's not that number. I think the code number is less..."
            newGame <- breakDwightCode (Game iamAt saidHi jimQuest creedQuest dwightQuest)
            return newGame
    else if (number < 4510)
        then do
            putStrLn "It's not that number. I think the code number is bigger..."
            newGame <- breakDwightCode (Game iamAt saidHi jimQuest creedQuest dwightQuest)
            return newGame
    else do
        putStrLn "I have broken the code!"
        putStrLn "There is a stapler here... I'm taking it!"
        putStrLn "Now I have to put it to jelly in the kitchen."
        newGame <- checkDwightDesk (Game iamAt saidHi StaplerOutClear creedQuest dwightQuest)
        return newGame


putJellyStapler :: Game -> IO Game
putJellyStapler (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
    if ((iamAt /= DwightDesk) && (jimQuest /= StaplerOutJelly))
    then do
        return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    else do
        putStrLn "Now the jelly stapler is in the Dwight drawer."
        putStrLn "Jim: The jelly stapler is in the Dwight desk drawer. Good job!"
        putStrLn "Jim gave me his reference."
        putStrLn "Michael will be proud of me when he sees this!"

        return (Game iamAt saidHi StaplerInJelly creedQuest dwightQuest)
