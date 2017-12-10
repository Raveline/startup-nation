module KeySignal where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import DOM (DOM)
import Signal (Signal, filter, (~>), merge)
import Signal.DOM (keyPressed)

type KeySignal eff = forall eff. Eff (dom :: DOM | eff) (Signal KeyEvent)

keys :: forall eff. KeySignal eff
keys = do
  enter <- keySignal Enter
  up <- keySignal Up
  down <- keySignal Down
  left <- keySignal Left
  right <- keySignal Right
  pure $ enter `merge` up `merge` down `merge` left `merge` right

keySignal :: forall eff. Key -> KeySignal eff
keySignal k = map (toKeyEvent k) <$> keyPressed (toKeyCode k)

toKeyEvent :: Key -> Boolean -> KeyEvent
toKeyEvent k true = Pressed k
toKeyEvent k false = Released k

toKeyCode :: Key -> Int
toKeyCode Enter = 13
toKeyCode Up = 75
toKeyCode Down = 74
toKeyCode Left = 72
toKeyCode Right = 76

data KeyEvent
  = Pressed Key
  | Released Key

data Key
  = Enter
  | Up
  | Down
  | Left
  | Right
