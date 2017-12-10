module Event
       ( Event(..)
       , FightEvent(..)
       , foldp
       , beginFight
       ) where

import Prelude

import Pux (EffModel, noEffects)
import Data.Maybe (Maybe(..), isJust)

import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)

import KeySignal (KeyEvent(..), Key(..))
import State (State, Step(..), activeCharacter, selectNextTarget, selectPrevTarget, chooseTarget)
import Models.Task (Task)

data Event
  = ChangeStep Step
  | FightE FightEvent
  | KeyPressed KeyEvent

data FightEvent
  = ChooseTarget
  | NextTarget
  | PreviousTarget
  | Execute

foldp :: forall fx. Event -> State -> EffModel State Event (console :: CONSOLE | fx)
foldp (KeyPressed keyEvent) s = case s.step of
                                     Home -> homeKeyPressed keyEvent s
                                     Fight -> fightKeyPressed keyEvent s
                                     _ -> noEffects s
foldp (ChangeStep nextStep) s = noEffects $ s { step = nextStep }
foldp (FightE _) s = noEffects s
foldp _ s = noEffects s

fightFoldp :: forall fx. Event -> State -> EffModel State Event fx
fightFoldp _ s = noEffects s

homeKeyPressed :: forall fx. KeyEvent -> State -> EffModel State Event fx
homeKeyPressed (Pressed Enter) state = { state
                                       , effects: [ pure <<< Just $ beginFight ]
                                       }
homeKeyPressed _ state = noEffects state

fightKeyPressed :: forall fx. KeyEvent -> State -> EffModel State Event fx
fightKeyPressed (Pressed k) state
  | isJust $ activeCharacter state.fightState = choiceKeyPressed k state
  | otherwise = noEffects state
fightKeyPressed _ state = noEffects state

choiceKeyPressed :: forall fx. Key -> State -> EffModel State Event fx
choiceKeyPressed Up state = { state: state { fightState = selectPrevTarget state.fightState }
                            , effects: []
                            }
choiceKeyPressed Down state = { state: state { fightState = selectNextTarget state.fightState }
                              , effects: []
                              }
choiceKeyPressed Enter state = { state: state { fightState = chooseTarget state.fightState }
                               , effects: [ execute ]
                               }
  where
    fightState' = chooseTarget state.fightState
    isLastChoice = isJust $ activeCharacter fightState'
    execute = if isLastChoice
                 then pure $ Just $ FightE Execute
                 else pure Nothing
choiceKeyPressed _ state = noEffects state

beginFight :: Event
beginFight = ChangeStep Fight
