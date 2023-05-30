module RemoveItem where
import Game

removeItem :: Eq a => [a] -> a -> [a]
removeItem (x : xs) item
    | x == item = xs
    | otherwise = x : removeItem xs item
removeItem _ _ = []

removeItemFromInventory :: Game -> Item -> IO Game
removeItemFromInventory (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) item = do
  let newInventory = removeItem inventory item
  let newGame = (Game iamAt saidHi jimQuest creedQuest dwightQuest newInventory)
  return newGame
