module Kitchen where

import Game
import Rooms

describe :: JimQuest -> IO ()
describe jimQuest = do
  putStrLn "You are in the kitchen"
  putStrLn "There is a coffee machine, some tea, a kettle, and some jelly powder."
  putStrLn "Maybe it will be useful later..."
  putStrLn "You can go to the 'break_room', 'bathroom' or to the 'openspace' from here."
  if jimQuest == StaplerOutClear
    then do
      putStrLn "Do you want to put the Dwight stapler to the jelly?"
      putStrLn "HINT: jelly_stapler"
    else return ()


jellyStapler :: Game -> IO Game
jellyStapler (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
    if ((iamAt /= Kitchen) && (jimQuest /= StaplerOutClear))
    then do
        return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
    else do
      putStrLn "Its ready!"
      putStrLn " /----------\\"
      putStrLn "/  |/----,,  \\"
      putStrLn "|  |[______   |"
      putStrLn "==============="
      putStrLn "Now I can put back the stapler to the drawer."
      return (Game iamAt saidHi StaplerOutJelly creedQuest dwightQuest)
