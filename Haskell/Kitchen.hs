module Kitchen where

import Game

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