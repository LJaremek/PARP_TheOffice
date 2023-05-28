module BreakRoom where

import Game

describe :: IO ()
describe = do
  putStrLn "You are in the break room"
  putStrLn "There's a vending machine here (HINT: machine)"
  putStrLn "You can go back to the kitchene from here"

machine :: Game -> IO Game
machine (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
  if (creedQuest == CreedQuestInProgress) then do
    newGame <- machineKeyboard (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    return newGame
  else if (creedQuest == CreedQuestNotStarted) then do
    putStrLn ""
    putStrLn "(It might be useful later)"
    putStrLn ""
    return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
  else do
    putStrLn ""
    putStrLn "(You've already used the coupon)"
    putStrLn ""
    return (Game iamAt saidHi jimQuest creedQuest dwightQuest)

isNumber :: String -> Bool
isNumber str =
  case reads str :: [(Double, String)] of
    [(_, "")] -> True   -- The string was completely parsed as a number
    _         -> False  -- The string couldn't be parsed as a number or had extra characters

machineKeyboard :: Game -> IO Game
machineKeyboard (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
  putStrLn ""
  putStrLn "Enter a number:"
  input <- getLine
  if (not (isNumber input)) then do
    putStrLn ""
    putStrLn "(Not a valid input)"
    putStrLn ""
    return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
  else if (input `elem` ["034", "015", "092", "059", "041", "065", "026", "087"]) then do
    putStrLn ""
    putStrLn "Can of some strange soda that you've never heard of rolled out... (it's not Grape Soda but it's better than nothing)"
    putStrLn ""
    return (Game iamAt saidHi jimQuest StrangeSoda dwightQuest)
  else do
    if input == "073"
      then do
        putStrLn ""
        putStrLn "You have the Grape Soda!"
        putStrLn ""
        return (Game iamAt saidHi jimQuest GrapeSoda dwightQuest)
      else do
        putStrLn ""
        putStrLn "Nothing happens..."
        putStrLn ""
        return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
