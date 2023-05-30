{-
To jest wersja po bardzo wielu poprawkach
Jest tak jak w repo czyimś z gitlaba (z grą 7 islands)
Czyli stan gry jest przechowywany z zmiennej Game
Która nam się bardzo rozrośnie
Ale chyba chuj z tym
-}
module NewMain where

import Data.IORef

import Data.Maybe

import Look
import Go
import ReadCommand
import Instructions

import Elevator
import Rooms
import Game
import Bathroom
import MichaelRoom
import DwightDesk
import CreedDesk
import Kitchen
import BreakRoom


enter_func :: Game -> IO Game
enter_func (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) = do
  let sh = saidHi
  if sh
    then do
      putStrLn ""
      putStrLn "As you step out of the elevator you enter the office openspace..."
      putStrLn "You see Jim approaching you with a big smile..."
      putStrLn ""
      putStrLn "Jim: Hi, I'm Jim! I'm glad to have the opportunity to assign to you something useful that will prove your competence. Dwight is working in our office, he's my best friend who LOVES jelly and staplers. Play him a funny prank, and I'll sign off on your task completion. It's worth checking out his desk in the openspace. Good luck!"
      putStrLn ""
      newGame <- go (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) Openspace
      return newGame
    else do
      putStrLn "You need to say hi first!"
      return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)

gameLoop :: Game -> IO Game
gameLoop game = do
    cmd <- readCommand
    let splitCmd = words cmd
    if null splitCmd
        then do
            putStrLn ""
            putStrLn "Type 'instructions' for a list of commands."
            putStrLn ""
            gameLoop game
        else do
            let cmdName = head splitCmd
            let cmdArgs = tail splitCmd
            case cmdName of
                "instructions" -> do
                  instructions
                  gameLoop game
                "look" -> do
                  look game
                  gameLoop game
                "go" -> do
                  newGame <- tryGo game cmdArgs
                  look newGame
                  gameLoop newGame
                "hi" -> do
                  newGame <- hi_func game
                  gameLoop newGame
                "enter" -> do
                  newGame <- enter_func game
                  gameLoop newGame
                "knock" -> do
                  newGame <- doDwightQuest game
                  look newGame
                  gameLoop newGame
                "michael" -> do
                  newGame <- talkToMichael game
                  gameLoop newGame
                "talk" -> do
                  newGame <- talkCreed game
                  gameLoop newGame
                "look_around" -> do
                  newGame <- checkDwightDesk game
                  gameLoop newGame
                "break_code" -> do
                  newGame <- breakDwightCode game
                  gameLoop newGame
                "jelly_stapler" -> do
                  newGame <- jellyStapler game
                  gameLoop newGame
                "put_jelly_stapler" -> do
                  newGame <- putJellyStapler game
                  gameLoop newGame
                "machine" -> do
                  newGame <- machine game
                  gameLoop newGame
                "quit" -> return game
                ":q" -> return game
                "exit" -> return game
                _ -> do
                    gameLoop game


start = do
  let game = Game { iamAt = Elevator
                  , saidHi = False
                  , jimQuest = StaplerInDesk
                  , creedQuest = CreedQuestNotStarted
                  , dwightQuest = DwightQuestNotStarted
                  , inventory = []
                  }
  look game
  gameLoop game
