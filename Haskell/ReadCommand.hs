module ReadCommand where

import GHC.IO.Handle (hFlush)
import System.IO (stdout)

readCommand :: IO String
readCommand = do
  putStr "> "
  hFlush stdout
  getLine