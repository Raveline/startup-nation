module Models.GameState where

data GameState
  = GameState { step :: GameStep
              }

data GameStep
  = Home
  | Fighting
  | NextLevel
  | GameOver

data FightEvent
  = FightWon
  | FightLost
  | NextTurn

nextStep :: FightEvent -> GameStep -> GameStep
nextStep _ Home = Fighting
nextStep FightWon Fighting = NextLevel
nextStep FightLost Fighting = GameOver
nextStep _ Fighting = Fighting
nextStep _ NextLevel = Fighting
nextStep _ GameOver = Home
