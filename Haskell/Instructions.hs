module Instructions where

instructions :: IO()
instructions = do
    putStrLn ""
    putStrLn "Available commands are:"
    putStrLn "start         - start the game"
    putStrLn "instructions  - see this message again"
    putStrLn "go <room>     - go to that room"
    putStrLn "look          - look around you"
    putStrLn "inventory     - show inventory"
    putStrLn "quit          - end the game and quit"
    putStrLn ""
