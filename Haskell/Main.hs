{-
To jest wersja po bardzo wielu poprawkach
Jest tak jak w repo czyimś z gitlaba (z grą 7 islands)
Czyli stan gry jest przechowywany z zmiennej Game
Która nam się bardzo rozrośnie
Ale chyba chuj z tym
-}
module NewMain where

import Data.IORef
import GHC.IO.Handle (hFlush)
import System.IO (stdout)
import Data.Maybe

import Look
import Go

import Elevator
import Rooms
import Game
import Bathroom

readCommand :: IO String
readCommand = do
    putStr "> "
    hFlush stdout
    getLine

-- Define a function for the user to enter the office
enter_func :: Game -> IO Game
enter_func (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
  let sh = saidHi
  if sh
    then do
      putStrLn ""
      putStrLn "As you step out of the elevator you enter the office openspace..."
      putStrLn "You see Jim approaching you with a big smile..."
      putStrLn "Jim: Hi, I'm Jim! I'm glad to have the opportunity to assign to you something useful that will prove your competence. Dwight is working in our office, he's my best friend who LOVES jelly and staplers. Play him a funny prank, and I'll sign off on your task completion. It's worth checking out his desk in the openspace. Good luck!"
      newGame <- go (Game iamAt saidHi jimQuest creedQuest dwightQuest) Openspace
      return newGame
    else do
      putStrLn "You need to say hi first!"
      return (Game iamAt saidHi jimQuest creedQuest dwightQuest)

gameLoop :: Game -> IO Game
gameLoop game = do
    cmd <- readCommand
    let splitCmd = words cmd
    if null splitCmd
        then do
            putStrLn "Type 'instructions' for a list of commands."
            gameLoop game
        else do
            let cmdName = head splitCmd
            let cmdArgs = tail splitCmd
            case cmdName of
                "hi" -> do
                  newGame <- hi_func game
                  gameLoop newGame
                "enter" -> do
                  newGame <- enter_func game
                  gameLoop newGame
                "knock" -> do
                  newGame <- doDwightQuest game
                  gameLoop newGame
                "go" -> do
                  newGame <- tryGo game cmdArgs
                  gameLoop newGame
                "quit" -> return game
                ":q" -> return game
                "exit" -> return game
                _ -> do
                    gameLoop game


-- Define the main program
start = do
  let game = Game { iamAt = Elevator
                  , saidHi = False
                  , jimQuest = StaplerInDesk
                  , creedQuest = CreedQuestNotStarted
                  , dwightQuest = DwightQuestNotStarted
                  }
  putStrLn "Welcome to Dunder Mifflin!"
  look game
  gameLoop game
