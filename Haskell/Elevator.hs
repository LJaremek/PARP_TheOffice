module Elevator where

import Rooms
import Game

describe = do
   putStrLn "You step into the elevator and when the doors are closing Michael (your boss) rushes inside."
   putStrLn ""
   putStrLn "Michael: Hi, you must be our new intern, welcome to Dunder Mifflin!"
   putStrLn "(HINT: type 'hi' to say hi)"

hi_func :: Game -> IO Game
hi_func (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) = do
   putStrLn ""
   putStrLn "Michael: During your internship you should obtain 3 (hopefully positive) reviews from other employees. Look around the office and see what you can do. When you are ready come to my room and I will take a look. Good luck!"
   putStrLn "(HINT: type 'enter' to enter the office)"
   putStrLn ""

   return (Game iamAt True jimQuest creedQuest dwightQuest inventory)


