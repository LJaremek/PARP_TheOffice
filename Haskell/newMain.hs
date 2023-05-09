{-
To jest wersja po bardzo wielu poprawkach
Jest tak jak w repo czyimś z gitlaba (z grą 7 islands)
Czyli stan gry jest przechowywany z zmiennej Game
Która nam się bardzo rozrośnie
Ale chyba chuj z tym
-}

import Data.IORef
import GHC.IO.Handle (hFlush)
import System.IO (stdout)

data Room = Elevator | Openspace deriving Eq

readCommand :: IO String
readCommand = do
    putStr "> "
    hFlush stdout -- Haskell does not flush to stdout until a newline appears by default
    getLine


instance Show Room where
  show Elevator = "elevator"
  show Openspace = "openspace"

-- Define a type to hold the game state
data Game = Game { iamAt :: Room
                 , saidHi :: Bool
                 }

-- Define a function to check whether there is a path between two locations
path :: Room -> Room -> IO Bool
path Elevator Openspace = return True
path Openspace Elevator = return True
path _ _ = return False

-- Define a function to change the current location
go :: Game -> Room -> IO Game
go (Game iamAt saidHi) room = do
  let here = iamAt
  if here == room
    then do
      putStrLn "You are already there."
      return (Game iamAt saidHi)
    else do
      can_go <- path here room
      if can_go
        then do
          let newIamAt = room
          putStrLn $ "You go to the " ++ show room ++ "."
          return (Game newIamAt saidHi)
        else do
          putStrLn "There is no path to that place."
          return (Game iamAt saidHi)

-- Define a function to describe the current location
look :: Game -> IO ()
look (Game iamAt saidHi) = do
  let place = iamAt
  describe place
  putStrLn ""

-- Define a function to print a description of a location
describe :: Room -> IO ()
describe Elevator = do
  putStrLn "You step into the elevator and when the doors are closing Michael (your boss) rushes inside."
  putStrLn ""
  putStrLn "Michael: Hi, you must be our new intern, welcome to Dunder Mifflin!"
  putStrLn "(HINT: type 'hi.' to say hi)"

-- Define an IORef to keep track of whether the user has said hi
--said_hi :: IORef Bool
--said_hi = newIORef False

-- Define a function for the user to say hi
hi_func :: Game -> IO Game
hi_func (Game iamAt saidHi)= do
  putStrLn ""
  putStrLn "Michael: During your internship you should obtain 3 (hopefully positive) reviews from other employees. Look around the office and see what you can do. When you are ready come to my room and I will take a look. Good luck!"
  putStrLn "(HINT: enter. to enter the office)"
  return (Game iamAt True)

-- Define a function for the user to enter the office
enter_func :: Game -> IO Game
enter_func (Game iamAt saidHi) = do
  let sh = saidHi
  if sh
    then do
      putStrLn ""
      putStrLn "As you step out of the elevator you enter the office openspace..."
      putStrLn "You see Jim approaching you with a big smile..."
      putStrLn "Jim: Hi, I'm Jim! I'm glad to have the opportunity to assign to you something useful that will prove your competence. Dwight is working in our office, he's my best friend who LOVES jelly and staplers. Play him a funny prank, and I'll sign off on your task completion. It's worth checking out his desk in the openspace. Good luck!"
      newGame <- go (Game iamAt saidHi) Openspace
      return newGame
    else do
      putStrLn "You need to say hi first!"
      return (Game iamAt saidHi)

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
                "quit" -> return game
                ":q" -> return game
                "exit" -> return game
                _ -> do
                    gameLoop game

-- Define the main program

main = do
  let game = Game { iamAt = Elevator
                  , saidHi = False
                  }
  putStrLn "Welcome to Dunder Mifflin!"
  look game
  gameLoop game
