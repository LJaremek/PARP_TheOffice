module Game where

import Rooms

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

data Game = Game { iamAt :: Room
                 , saidHi :: Bool
                 , jimQuest :: JimQuest
                 , creedQuest :: CreedQuest
                 , dwightQuest :: DwightQuest
                 }