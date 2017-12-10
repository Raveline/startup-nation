module Event
       ( Event(..)
       , FightEvent(..)
       , foldp
       , beginFight
       ) where

import Prelude

import Pux (EffModel, noEffects)
import Data.Maybe (Maybe(..))

import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)

import KeySignal (KeyEvent(..), Key(..))
import State (State, Step(..))

data Event
  = ChangeStep Step
  | FightE FightEvent
  | KeyPressed KeyEvent

data FightEvent
  = Choose
  | Execute

foldp :: forall fx. Event -> State -> EffModel State Event (console :: CONSOLE | fx)
foldp (KeyPressed (Pressed Enter)) s = { state: s
                                       , effects: [ pure $ Just (ChangeStep Fight) ]
                                       }
foldp (ChangeStep nextStep) s = noEffects $ s { step = nextStep }
foldp (FightE _) s = noEffects s
foldp _ s = noEffects s

beginFight :: Event
beginFight = ChangeStep Fight
