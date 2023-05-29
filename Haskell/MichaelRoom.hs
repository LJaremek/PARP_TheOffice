module MichaelRoom where

import Game
import Go
import Rooms

import System.Exit

describe :: JimQuest -> CreedQuest -> DwightQuest -> IO ()
describe jimQuest creedQuest dwightQuest = do
  putStrLn "You are in the Michael's room."
  putStrLn "He is setting at the desk and doing some very important stuff on his computer."
  putStrLn "(HINT: michael)"
  putStrLn "You can go back to the 'openspace' from here"

talkToMichael :: Game -> IO Game
talkToMichael (Game iamAt saidHi jimQuest creedQuest dwightQuest) = do
  if iamAt /= MichaelRoom
    then return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
  else if (
      (dwightQuest /= DwightQuestDoneHalf && dwightQuest /= DwightQuestDoneFull)
      ||
      (jimQuest /= StaplerInJelly)
      ||
      (creedQuest /= CreedQuestDoneHalf && creedQuest /= CreedQuestDoneFull)
    )
  then do
    putStrLn "(You haven't obtained 3 reviews yet, you should do that before talking to Michael)"
    putStrLn "(HINT: go openspace.)"
    return (Game iamAt saidHi jimQuest creedQuest dwightQuest)
  else do
    if (dwightQuest == DwightQuestDoneHalf && creedQuest == CreedQuestDoneHalf)
      -- poor (1/3)
      then do
        putStrLn "Michael: Who do we have here? It's our future employee! Welcome! Please show me the reviews from my people. Oh my! What a massacre! I have never seen so bad employee reviews. What was I saying? Oh yes, about your job application. It's very nice, but that's all for today. We will call you back, goodbye. What? No, we don't need your phone number, have a nice day."
        putStrLn ""
        putStrLn "END OF THE GAME"
        putStrLn ""
        putStrLn "Thanks for playing ;)"
        exitSuccess
    else if (dwightQuest == DwightQuestDoneFull && creedQuest == CreedQuestDoneFull)
      -- good (3/3)
      then do
        putStrLn "Michael: Okay, what do we have here? Hmm, okay. Fantastic! I see that each of my top three employees has given you a positive review, I'm impressed! Thank you for this wonderful day and welcome aboard the company! That's all for today, go home and celebrate the success, and see you tomorrow morning. Take care!"
        putStrLn ""
        putStrLn ""
        putStrLn "END OF THE GAME"
        putStrLn ""
        putStrLn "Thanks for playing ;)"
        exitSuccess
    else do
      -- medium (2/3)
      putStrLn "Hi, I see you have reviews from my employees, great, let's see what they wrote. Hmmm, I see that the experts' opinions are divided. Well, these aren't the best reviews I've ever seen, but they're not the worst either. You didn't do that bad overall, I'll cut your salary a bit and the company will be satisfied with you. So, welcome aboard! Come in tomorrow at 8 AM."
      putStrLn ""
      putStrLn ""
      putStrLn "END OF THE GAME"
      putStrLn ""
      putStrLn "Thanks for playing ;)"
      exitSuccess
