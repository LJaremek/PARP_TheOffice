module Game where

import Rooms

-- To są takie jakby enumy normalne
data JimQuest = StaplerInDesk
              | StaplerOutClear
              | StaplerOutJelly
              | StaplerInJelly deriving Eq

data CreedQuest = CreedQuestNotStarted
                | CreedQuestInProgress
                | GrapeSoda
                | StrangeSoda
                | CreedQuestDoneHalf
                | CreedQuestDoneFull deriving Eq

data DwightQuest = DwightQuestNotStarted {-bathroom locked-}
                 | DwightQuestDoneHalf {-door destroyed-}
                 | DwightQuestDoneFull deriving Eq

-- Define a type to hold the game state
-- Ta klaska nam trzyma wszystkie zmienne globalne
data Game = Game { iamAt :: Room
                 , saidHi :: Bool
                 , jimQuest :: JimQuest
                 , creedQuest :: CreedQuest
                 , dwightQuest :: DwightQuest
                 }