module MichaelRoom where

import Game
import Go
import Rooms

describe :: JimQuest -> CreedQuest -> DwightQuest -> IO ()
describe jimQuest creedQuest dwightQuest = do
  if (
      (dwightQuest /= DwightQuestDoneHalf && dwightQuest /= DwightQuestDoneFull)
      ||
      (jimQuest /= StaplerInJelly)
      ||
      (creedQuest /= CreedQuestDoneHalf && creedQuest /= CreedQuestDoneFull)
    )
    then do
        putStrLn "You are in the Michael's room"
        putStrLn "(You haven't obtained 3 reviews yet, you should do that before talking to Michael)"
        putStrLn "(HINT: go openspace.)"
    else do
        putStrLn "You are in the Michael's room"
        putStrLn "(HINT: michael)"
        putStrLn "You can go back to the 'openspace' from here"

-- talkToMichael :: Game -> IO Game
-- talkToMichael (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do

-- TODO
