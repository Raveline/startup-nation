module State where

type State
  = { step :: Step
    }

initialState :: State
initialState = { step: Home }

data Step
  = Home
  | Fight
  | GameOver
