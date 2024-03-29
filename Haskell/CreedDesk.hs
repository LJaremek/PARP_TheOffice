module CreedDesk where

import Game
import RemoveItem

describe :: IO ()
describe = do
    putStrLn "You see Creed playing solitaire on his computer while eating an apple..."
    putStrLn "(HINT: talk)"
    putStrLn "You can go back to 'openspace' from here."

talkCreed :: Game -> IO Game
talkCreed (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) = do
    if (creedQuest == CreedQuestNotStarted)
        then do
            putStrLn ""
            putStrLn "Creed: Hi kid, I have some small job for you."
            putStrLn ""
            newGame <- decideCreedQuest (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
            return newGame
    else if (creedQuest == CreedQuestDoneHalf || creedQuest == CreedQuestDoneFull)
        then do
            putStrLn ""
            putStrLn "Creed: Hi kid, thanks for the drink once again!"
            putStrLn ""
            return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
    else if (creedQuest == GrapeSoda)
        then do
            putStrLn ""
            putStrLn "Creed: Hi kid, I see you have my Grape Soda, nice job!"
            putStrLn "Creed: I'm giving you a great review!"
            putStrLn ""
            let reducedInventory = removeItem inventory GrapeSodaItem
            let newInventory = reducedInventory ++ [CreedReference]
            return (Game iamAt saidHi jimQuest CreedQuestDoneFull dwightQuest newInventory)
    else if (creedQuest == StrangeSoda)
        then do
            putStrLn ""
            putStrLn "Creed: It's not the grape soda but it will do the thing, thanks kid!"
            putStrLn "Creed: I'm giving you a pretty good review!"
            putStrLn ""
            let reducedInventory = removeItem inventory StrangeSodaItem
            let newInventory = reducedInventory ++ [CreedReference]
            return (Game iamAt saidHi jimQuest CreedQuestDoneHalf dwightQuest newInventory)
    else do
        putStrLn "Creed plays solitaire without even noticing you"
        putStrLn "(HINT: go openspace)"
        putStrLn ""
        return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)

decideCreedQuest :: Game -> IO Game
decideCreedQuest (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) = do
    putStrLn "Enter the number of selected dialogue option:"
    putStrLn "  1 - Ok, I will do it. (start quest)"
    putStrLn "  2 - Sorry, but I don't have time right now. (leave)"

    input <- getLine
    if (input == "1")
        then do
            putStrLn ""
            putStrLn "Creed: Cool beans!"
            let newInventory = inventory ++ [Coupon]
            newGame <- displayCreedQuestOpening (Game iamAt saidHi jimQuest creedQuest dwightQuest newInventory)
            return newGame
    else if (input == "2")
        then do
            putStrLn ""
            putStrLn "Creed: Ok..."
            putStrLn ""
            return (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
    else
        do
            putStrLn ""
            putStrLn "(Not a valid dialogue option)"
            putStrLn ""
            newGame <- decideCreedQuest (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory)
            return newGame

displayCreedQuestOpening :: Game -> IO Game
displayCreedQuestOpening (Game iamAt saidHi jimQuest creedQuest dwightQuest inventory) = do
    putStrLn "Creed: So... I have this coupon for one free soda in our vending machine. I would like to drink some Grape Soda, but the thing is that this coupon is strange. I don't know how to use it, maybe you will figure it out."
    putStrLn "Creed: Here is the coupon..."
    putStrLn ""
    putStrLn "       =ONE FREE SODA="
    putStrLn "          F   G   H"
    putStrLn "       P 034 015 092"
    putStrLn "       R 059 041 065"
    putStrLn "       S 026 073 087"
    putStrLn ""
    putStrLn "Creed: As I said, I would prefer the Grape Soda, but I don't know how to order it using this strange coupon..."
    putStrLn "Creed: When you will figure out the proper code, go to the break room and type it into the vending machine which is standing there."
    putStrLn "(HINT: you can display coupon typing 'coupon')"
    putStrLn ""
    return (Game iamAt saidHi jimQuest CreedQuestInProgress dwightQuest inventory)