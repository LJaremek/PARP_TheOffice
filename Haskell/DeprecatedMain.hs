{-
To jest wersja wygenerowana przez ChatGPT po poprawkach
Do zmiany zmiennych globalnych używa niezalecanego rozwiązania Sytem.IO.Unsafe xddd
Nie wiem czy to jest git
-}



import Data.IORef
import System.IO.Unsafe

data Room = Elevator | Openspace deriving Eq

instance Show Room where
  show Elevator = "elevator"
  show Openspace = "openspace"

-- Define an IORef to represent the current location
i_am_at :: IORef Room
i_am_at = unsafePerformIO $ newIORef Elevator

-- Define a function to check whether there is a path between two locations
path :: Room -> Room -> IO Bool
path Elevator Openspace = return True
path Openspace Elevator = return True
path _ _ = return False

-- Define a function to change the current location
go :: Room -> IO ()
go room = do
  here <- readIORef i_am_at
  if here == room
    then putStrLn "You are already there."
    else do
      can_go <- path here room
      if can_go
        then do
          writeIORef i_am_at room
          putStrLn $ "You go to the " ++ show room ++ "."
          look
        else putStrLn "There is no path to that place."

-- Define a function to describe the current location
look :: IO ()
look = do
  place <- readIORef i_am_at
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
said_hi :: IORef Bool
said_hi = unsafePerformIO $ newIORef False

-- Define a function for the user to say hi
hi :: IO ()
hi = do
  putStrLn ""
  putStrLn "Michael: During your internship you should obtain 3 (hopefully positive) reviews from other employees. Look around the office and see what you can do. When you are ready come to my room and I will take a look. Good luck!"
  putStrLn "(HINT: enter. to enter the office)"
  writeIORef said_hi True

-- Define a function for the user to enter the office
enter :: IO ()
enter = do
  sh <- readIORef said_hi
  if sh
    then do
      putStrLn ""
      putStrLn "As you step out of the elevator you enter the office openspace..."
      putStrLn "You see Jim approaching you with a big smile..."
      putStrLn "Jim: Hi, I'm Jim! I'm glad to have the opportunity to assign to you something useful that will prove your competence. Dwight is working in our office, he's my best friend who LOVES jelly and staplers. Play him a funny prank, and I'll sign off on your task completion. It's worth checking out his desk in the openspace. Good luck!"
      go Openspace
    else putStrLn "You need to say hi first!"

-- Define the main program
main :: IO ()
main = do
  putStrLn "Welcome to Dunder Mifflin!"
  look
