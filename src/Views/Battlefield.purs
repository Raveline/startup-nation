module Views.Battlefield where

import Prelude hiding (div)

import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (div, img, p)
import Text.Smolder.HTML.Attributes (className, src)
import Text.Smolder.Markup (text, (!))

import Models.Character (Character(..), Category(..))
import Models.Team (Team(..))
import Models.Task (Task(..))

import Views.Team (team)
import Views.Task (tasks)

import Event (Event)

battlefield :: HTML Event
battlefield = div ! className "battlefield" $ do
  team team1
  tasks taskList

team1 :: Team
team1 = Team [ tom, adrien ]

tom :: Character
tom = Character { name: "Tom"
                , category: Developper
                , attack: 0
                , defense: 0
                , pv: 10
                , remainingLife: 10
                , velocity: 1
                }

adrien :: Character
adrien = Character { name: "Adrien"
                   , category: Developper
                   , attack: 0
                   , defense: 0
                   , pv: 10
                   , remainingLife: 10
                   , velocity: 1
                   }

taskList :: Array Task
taskList = [ fixBug
           , meetInvestors
           , putInProd
           ]

fixBug :: Task
fixBug = Task { name: "Fix bug", pv: 2, remainingLife: 2 }

meetInvestors :: Task
meetInvestors = Task { name: "Meet investors", pv: 2, remainingLife: 2 }

putInProd :: Task
putInProd = Task { name: "Put in production", pv: 2, remainingLife: 2 }
