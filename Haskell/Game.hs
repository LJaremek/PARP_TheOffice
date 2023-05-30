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

data Item = CreedReference
          | JimReference
          | DwightReference
          | Stapler
          | StaplerInJellyItem
          | GrapeSodaItem
          | StrangeSodaItem
          | Coupon deriving Eq

instance Show Item where
  show CreedReference = "Creed's reference"
  show JimReference = "Jim's reference"
  show DwightReference = "Dwight's reference"
  show Stapler = "Stapler"
  show StaplerInJellyItem = "Stapler in jelly"
  show GrapeSodaItem = "Grape soda"
  show StrangeSodaItem = "Strange soda"
  show Coupon = "Coupon to the vending machine (HINT: type 'coupon' to have a look)"

-- Define a type to hold the game state
data Game = Game { iamAt :: Room
                 , saidHi :: Bool
                 , jimQuest :: JimQuest
                 , creedQuest :: CreedQuest
                 , dwightQuest :: DwightQuest
                 , inventory :: [Item]
                 }