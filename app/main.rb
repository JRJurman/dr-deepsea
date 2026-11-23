CHIP_WIDTH = 100

SUB_SPRITE = {
  w: 100,
  h: 100,
  path: "sprites/sub.png",
  anchor_x: 0.5,
  anchor_y: 0.4
}

PLAYER_SPRITE = {
  w: 100,
  h: 100,
  path: "sprites/explorer.png",
  anchor_x: 0.5,
  anchor_y: 0.4
}

EMPTY_CHIP_SPRITE = {
  w: 100,
  h: 100,
  path: "sprites/blank.png",
  anchor_x: 0.5,
  anchor_y: 0.5
}

CHIP_SPRITES = {
  1 => {
    w: CHIP_WIDTH,
    h: CHIP_WIDTH,
    path: "sprites/level1_back.png",
    anchor_x: 0.5,
    anchor_y: 0.5
  },
  2 => {
    w: CHIP_WIDTH,
    h: CHIP_WIDTH,
    path: "sprites/level2_back.png",
    anchor_x: 0.5,
    anchor_y: 0.5
  },
  3 => {
    w: CHIP_WIDTH,
    h: CHIP_WIDTH,
    path: "sprites/level3_back.png",
    anchor_x: 0.5,
    anchor_y: 0.5
  },
  4 => {
    w: CHIP_WIDTH,
    h: CHIP_WIDTH,
    path: "sprites/level4_back.png",
    anchor_x: 0.5,
    anchor_y: 0.5
  }
}

LEVEL1_CHIPS = [
  { type: 'chip', level: 1, value: 0 },
  { type: 'chip', level: 1, value: 0 },
  { type: 'chip', level: 1, value: 1 },
  { type: 'chip', level: 1, value: 1 },
  { type: 'chip', level: 1, value: 2 },
  { type: 'chip', level: 1, value: 2 },
  { type: 'chip', level: 1, value: 3 },
  { type: 'chip', level: 1, value: 3 },
]
LEVEL2_CHIPS = [
  { type: 'chip', level: 2, value: 4 },
  { type: 'chip', level: 2, value: 4 },
  { type: 'chip', level: 2, value: 5 },
  { type: 'chip', level: 2, value: 5 },
  { type: 'chip', level: 2, value: 6 },
  { type: 'chip', level: 2, value: 6 },
  { type: 'chip', level: 2, value: 7 },
  { type: 'chip', level: 2, value: 7 },
]
LEVEL3_CHIPS = [
  { type: 'chip', level: 3, value: 8 },
  { type: 'chip', level: 3, value: 8 },
  { type: 'chip', level: 3, value: 9 },
  { type: 'chip', level: 3, value: 9 },
  { type: 'chip', level: 3, value: 10 },
  { type: 'chip', level: 3, value: 10 },
  { type: 'chip', level: 3, value: 11 },
  { type: 'chip', level: 3, value: 11 },
]
LEVEL4_CHIPS = [
  { type: 'chip', level: 4, value: 12 },
  { type: 'chip', level: 4, value: 12 },
  { type: 'chip', level: 4, value: 13 },
  { type: 'chip', level: 4, value: 13 },
  { type: 'chip', level: 4, value: 14 },
  { type: 'chip', level: 4, value: 14 },
  { type: 'chip', level: 4, value: 15 },
  { type: 'chip', level: 4, value: 15 },
]

FIRST_BUTTON_BORDER = {
  x: 500,
  y: 180,
  w: 280,
  h: 80
}
FIRST_BUTTON_LABEL = {
  x: FIRST_BUTTON_BORDER.x + FIRST_BUTTON_BORDER.w/2,
  y: FIRST_BUTTON_BORDER.y + FIRST_BUTTON_BORDER.h/2,
  size_enum: 4,
  anchor_x: 0.5,
  anchor_y: 0.5,
}

SECOND_BUTTON_BORDER = {
  x: 800,
  y: 180,
  w: 280,
  h: 80
}
SECOND_BUTTON_LABEL = {
  x: SECOND_BUTTON_BORDER.x + SECOND_BUTTON_BORDER.w/2,
  y: SECOND_BUTTON_BORDER.y + SECOND_BUTTON_BORDER.h/2,
  size_enum: 4,
  anchor_x: 0.5,
  anchor_y: 0.5,
}

READOUT_BORDER = {
  x: 500,
  y: 50,
  w: 700,
  h: 100
}
READOUT_LABEL = {
  x: READOUT_BORDER.x + 10,
  y: READOUT_BORDER.y + READOUT_BORDER.h - 10,
  size_enum: 3,
}

# possible states are: "Start", "ReduceAir", "Turn", "Roll", "Search"
UI_MAP = {
  Start: {
    start: { up: :board, left: :bag },
    board: { down: :start, up: :oxygen },
    oxygen: { down: :board },
    bag: { up: :board, right: :start }
  },
  ReduceAir: {
    confirm: { up: :board, left: :bag },
    board: { down: :confirm, up: :oxygen },
    oxygen: { down: :board },
    bag: { up: :board, right: :confirm }
  },
  Turn: {
    continue: { up: :board, left: :bag, right: :turn },
    turn: { up: :board, left: :continue },
    board: { down: :continue, up: :oxygen },
    oxygen: { down: :board },
    bag: { up: :board, right: :continue }
  },
  Roll: {
    roll: { up: :board, left: :bag },
    board: { down: :roll, up: :oxygen },
    oxygen: { down: :board },
    bag: { up: :board, right: :roll }
  },
  SearchChip: {
    continue: { up: :board, left: :bag, right: :pickup },
    pickup: { up: :board, left: :continue },
    board: { down: :continue, up: :oxygen },
    oxygen: { down: :board },
    bag: { up: :board, right: :continue }
  },
  SearchBlank: {
    continue: { up: :board, left: :bag, right: :drop },
    drop: { up: :board, left: :continue },
    board: { down: :continue, up: :oxygen },
    oxygen: { down: :board },
    bag: { up: :board, right: :continue }
  }
}

def getSelectionText args, repeatInstructions=false
  introText = "Welcome to Deep Sea Adventure! "
  startText = "Start Game button selected. Press enter to start."
  navText = " Press up to view the board, and press left to view your bag."
  if args.state.selection == :start
    if !args.state.hasHeardStartReadout || repeatInstructions
      args.state.hasHeardStartReadout = true
      return introText + startText + navText
    end

    return startText
  end

  if args.state.turnState == :Confirmation
    return args.state.confirmationText
  end

  if args.state.selection == :bag
    bagText = "Bag selected. You have #{args.state.player.chips.length} chips. You will lose #{args.state.player.chips.length} oxygen on moving."
    navText = " Press up to see the board and right to look at available actions."
    if !args.state.hasHeardBagReadout || repeatInstructions
      args.state.hasHeardBagReadout = true
      return bagText + navText
    end

    return bagText
  end

  if args.state.selection == :board
    boardText = "Board selected."
    spaceText = "You are on the sub."
    if args.state.player.space > 0
      spaceType = args.state.spaces[args.state.player.space][0].type
      spaceDescription = 'You are on top of '
      spaceLevel = args.state.spaces[args.state.player.space][0].level
      if spaceType == 'chip'
        spaceDescription += "a level #{spaceLevel} chip."
      elsif spaceType == 'chip-stack'
        spaceDescription += "a stack of N chips."
      end
      nextText = ""

      spaceAfterPlayer = args.state.spaces[args.state.player.space..args.state.spaces.length]
      nextLevelIndex = spaceAfterPlayer.find_index { |space| space[0].level != spaceLevel }
      nextLevelLevel = spaceAfterPlayer[nextLevelIndex][0].level
      nextLevelType = spaceAfterPlayer[nextLevelIndex][0].type
      spacesToNextLevel = nextLevelIndex
      if args.state.player.facing == 'diving'
        if nextLevelType == 'chip-stack'
          nextText = "You are #{spacesToNextLevel} spaces away from a chip-stack"
        else
          nextText = "You are #{spacesToNextLevel} spaces away from a level #{nextLevelLevel} chip."
        end
      end

      spaceText = " You are #{args.state.player.space} spaces away from the sub. #{spaceDescription} #{nextText}"
    end
    navText = " Press up to view air levels, press down to see available actions."
    if !args.state.hasHeardBoardReadout || repeatInstructions
      args.state.hasHeardBoardReadout = true
      return boardText + spaceText + navText
    end

    return boardText + spaceText
  end

  if args.state.selection == :oxygen
    oxygenText = "Air Level selected. You have #{args.state.airLevel} units of air left. You'll lose #{args.state.player.chips.length} units on the next move."
    navText = " Press down to view the board."
    if !args.state.hasHeardAirReadout || repeatInstructions
      args.state.hasHeardAirReadout = true
      return oxygenText + navText
    end

    return oxygenText
  end

  if args.state.selection == :roll
    rollText = "Roll button selected. Press to roll dice and move. "
    weighText = ""
    if args.state.player.chips.length > 0
      weighText = "You have #{args.state.player.chips.length} chips weighing you down."
    end
    navText = " Press up to view the board, and press left to view your bag."
    if !args.state.hasHeardRollReadout || repeatInstructions
      args.state.hasHeardRollReadout = true
      return rollText + weighText + navText
    end

    return rollText + weighText
  end

  if args.state.turnState == :SearchChip && args.state.selection == :continue
    continueText = "One of two actions - Continue button selected, press to skip picking up this chip."
    navText = " Press right to view pickup option."
    if !args.state.hasHeardPickupReadout || repeatInstructions
      args.state.hasHeardPickupReadout = true
      return continueText + navText
    end

    return continueText
  end

  if args.state.turnState == :SearchChip && args.state.selection == :pickup
    chipDescription = ""
    chip = args.state.spaces[args.state.player.space][0]
    if chip.type == 'chip-stack'
      chipDescription = 'chip stack'
    elsif chip.type == 'chip'
      chipDescription = "level #{chip.level} chip"
    end
    pickupText = "Second Action - Pickup button selected, press to grab this #{chipDescription}."
    return pickupText
  end

  if args.state.turnState == :SearchBlank && args.state.selection == :continue
    continueText = "One of two actions - Continue button selected, press to continue moving."
    navText = " Press right to view drop option."
    if !args.state.hasHeardDropReadout || repeatInstructions
      args.state.hasHeardDropReadout = true
      return continueText + navText
    end

    return continueText
  end

  if args.state.turnState == :SearchBlank && args.state.selection == :drop
    chipDescription = ""
    chip = args.state.spaces[args.state.player.space][0]
    pickupText = "Second Action - Drop Piece button selected, press to drop a piece."
    return pickupText
  end

  if args.state.turnState == :ReduceAir && args.state.selection == :confirm
    airText = "You have #{args.state.player.chips.length} chips, which reduces your air by #{args.state.player.chips.length}. Your current air level is #{args.state.airLevel}. Press enter to continue."
    return airText
  end

  if args.state.turnState == :Turn && args.state.selection == :continue
    continueText = "One of two actions - Continue Diving button selected, press to keep searching for treasure. "
    navText = " Press right to view turn around option."

    if !args.state.hasHeardTurnReadout || repeatInstructions
      args.state.hasHeardTurnReadout = true
      return continueText + navText
    end

    return continueText
  end

  if args.state.turnState == :Turn && args.state.selection == :turn
    turnText = "Second Action - Turn Around and start heading back to the sub. You are #{args.state.player.space} spaces away from the sub."
    return turnText
  end

  return ''
end

def buildSpacesArray
  shuffledLevel1Chips = LEVEL1_CHIPS.shuffle
  shuffledLevel2Chips = LEVEL2_CHIPS.shuffle
  shuffledLevel3Chips = LEVEL3_CHIPS.shuffle
  shuffledLevel4Chips = LEVEL4_CHIPS.shuffle

  orderedChips = shuffledLevel1Chips + shuffledLevel2Chips + shuffledLevel3Chips + shuffledLevel4Chips

  # give all chips a random rotation
  orderedChips.each do |chip|
    chip.angle = rand(360)
  end

  # wrap each chip in an array (since a single space can have multiple chips + the player)
  orderedChipStacks = orderedChips.map { |chip| [chip] }
end

def rollDice
  return [Numeric.rand(1..3), Numeric.rand(1..3)]
end

def onStartGameSelected args
  args.state.turnState = :Roll
  args.state.selection = :roll
end

def onAdvanceState args
  args.state.turnState = args.state.nextTurnState
  args.state.selection = args.state.nextSelection
end

def onReduceAirConfirmed args
  # if air was already 0, then end round
  if args.state.airLevel < 1
    args.state.turnState = :RoundEnd
  else
    # reduce air
    args.state.airLevel -= args.state.player.chips.length

    # if they haven't turned around, allow them to now
    if args.state.player.facing == 'diving'
      args.state.turnState = :Turn
      args.state.selection = :continue
    else
      args.state.turnState = :Roll
      args.state.selection = :roll
    end
  end
end

def onTurnAroundSelected args
  args.state.player.facing = 'surfacing'

  args.state.turnState = :Confirmation
  args.state.confirmationText = "Turning back to the sub! Press enter to continue."

  args.state.nextTurnState = :Roll
  args.state.nextSelection = :roll
end

def onTurnAroundSkipped args
  args.state.turnState = :Roll
  args.state.selection = :roll
end

def onRollSelected args
  # roll and save it to player state
  rolledDice = rollDice()
  args.state.player.lastRoll = rolledDice
  rollValue = rolledDice[0] + rolledDice[1]

  # determine how many spaces we move
  spacesMoved = [rollValue - args.state.player.chips.length, 0].max

  # if we are surfacing, flip the spacesMoved
  if args.state.player.facing == 'surfacing'
    spacesMoved = -spacesMoved
  end

  # cap to the start and end of the board
  newSpace = args.state.player.space + spacesMoved
  newSpace = [newSpace, 0].max
  newSpace = [newSpace, args.state.spaces.length].min

  # move the player piece
  args.state.spaces[args.state.player.space].pop()
  args.state.spaces[newSpace] << { type: 'player' }
  args.state.player.space = newSpace

  args.state.turnState = :Confirmation
  args.state.confirmationText = "Rolled a #{rolledDice[0]} and #{rolledDice[1]}. Moved #{(spacesMoved).abs} spaces and landed on space #{args.state.player.space}. Press enter to continue."

  # if they are back on the sub, end round (otherwise, search)
  if args.state.player.space == 0
    args.state.nextTurnState = :RoundEnd
  else
    # check if we are on a chip or a blank
    if args.state.spaces[args.state.player.space][0].type == 'blank'
      args.state.nextTurnState = :SearchBlank
      args.state.nextSelection = :continue
    else
      args.state.nextTurnState = :SearchChip
      args.state.nextSelection = :continue
    end
  end
end

def onSearchSkipped args
  args.state.turnState = :ReduceAir
  args.state.selection = :confirm
end

def onSearchPickUp args
  # pull the first token from the stack
  token = args.state.spaces[args.state.player.space].shift()
  args.state.player.chips << token

  # put a blank chip on the stack
  args.state.spaces[args.state.player.space].unshift({ type: 'blank' })

  args.state.turnState = :Confirmation
  if token.type == 'chip'
    args.state.confirmationText = "Picked up level #{token.level} chip. Press enter to continue."
  elsif token.type == 'chip-stack'
    args.state.confirmationText = "Picked up level chip stack. Press enter to continue."
  else
    args.state.confirmationText = ""
  end

  args.state.nextTurnState = :ReduceAir
  args.state.nextSelection = :confirm
end

def onSearchDropChip args
  args.state.turnState = :BagSelect
end

def onBagDropSelection args
  # remove the blank chip
  args.state.spaces[args.state.player.space].shift()

  # remove the selected bag chip from bag
  mockBagIndex = 3 # TODO
  token = args.state.player.chips[mockBagIndex]
  args.state.player.chips.delete_at(mockBagIndex)

  # put that chip on the player's space
  args.state.spaces[args.state.player.space].unshift(token)

  args.state.turnState = :BagSelect
end

module Main
  def tick args
    if !args.state.gameStarted
      args.state.gameStarted = true
      init(args)
      puts 'game started'
    end

    input(args)
    draw(args)
  end

  def init args
    # default air level
    args.state.airLevel ||= 25
    args.state.round ||= 1

    # state of the turn
    # possible states are: "Start", "ReduceAir", "Turn", "Roll", "SearchChip" / "SearchBlank"
    args.state.turnState ||= :Start
    args.state.selection ||= :start
    args.state.readout ||= getSelectionText(args)
    args.state.lastReadout ||= ""

    # pull the initial round of chips
    args.state.spaces ||= []
    if (args.state.spaces.length == 0)
      # empty starting space for players
      args.state.spaces.unshift([{ type: 'sub' }, { type: 'player' }])
      # and the spaces for all the chips!
      args.state.spaces.concat(buildSpacesArray())
    end

    # put the player on the first space
    args.state.player ||= { facing: 'diving', chips: [], space: 0 }
  end

  def input args
    navKey = [:up, :down, :left, :right].find { |key| args.inputs.keyboard.key_up.send(key) }
    if navKey
      turnState = args.state.turnState
      currentSelection = args.state.selection

      puts "turnState #{turnState}"
      puts "currentSelection #{currentSelection}"
      puts "navKey #{navKey}"

      newSelection = UI_MAP[turnState][currentSelection][navKey]

      if newSelection
        args.state.selection = newSelection
        args.state.readout = getSelectionText(args)
        puts "newSelection #{newSelection}"
      end
    end

    selectKey = [:enter, :space].find { |key| args.inputs.keyboard.key_up.send(key) }
    turnState = args.state.turnState
    selection = args.state.selection
    if selectKey
      if turnState == :Confirmation
        onAdvanceState(args)
        args.state.readout = getSelectionText(args)
      elsif selection == :start
        onStartGameSelected(args)
        args.state.readout = getSelectionText(args)
      elsif selection == :roll
        onRollSelected(args)
        args.state.readout = getSelectionText(args)
      elsif ((turnState == :SearchChip || turnState == :SearchBlank)  && selection == :continue)
        onSearchSkipped(args)
        args.state.readout = getSelectionText(args)
      elsif turnState == :SearchChip && selection == :pickup
        onSearchPickUp(args)
        args.state.readout = getSelectionText(args)
      elsif turnState == :SearchBlank && selection == :drop
        onSearchDropChip(args)
        args.state.readout = getSelectionText(args)
      elsif turnState == :ReduceAir && selection == :confirm
        onReduceAirConfirmed(args)
        args.state.readout = getSelectionText(args)
      elsif turnState == :Turn && selection == :continue
        onTurnAroundSkipped(args)
        args.state.readout = getSelectionText(args)
      elsif turnState == :Turn && selection == :turn
        onTurnAroundSelected(args)
        args.state.readout = getSelectionText(args)
      end

      puts "turnState #{args.state.turnState}"
      puts "selection #{args.state.selection}"
    end
  end

  def draw args
    # draw the air levels
    circleWidth = 44
    circleHeight = 44

    26.times do |index|
      spritePath = "sprites/air_level_space.png"
      if (index == args.state.airLevel)
        spritePath = "sprites/air_level_marker.png"
      end
      args.outputs.labels << {
        x:  1190 - (index * circleWidth),
        y: 700,
        text: index
      }
      args.outputs.sprites << {
        x: 1200 - (index * circleWidth),
        y: 650,
        w: circleWidth,
        h: circleHeight,
        path: spritePath,
        anchor_x: 0.5,
        anchor_y: 0.5
      }
    end

    # draw the chips
    placingRight = true
    lastX = 00
    lastY = 550
    args.state.spaces.each_with_index do |space, spaceIndex|
      # place this chip to the right (or left of the last one)
      if (placingRight)
        lastX += CHIP_WIDTH
      else
        lastX -= CHIP_WIDTH
      end

      # if we hit some boundary, start going the other way
      if ( (placingRight and lastX > 1100) or
            (!placingRight and lastX < 100) )

        # push this chip a little to the left or right
        if (placingRight)
          lastX -= 50
        else
          lastX += 50
        end
        placingRight = !placingRight
        lastY -= 100
      end

      space.each do |token|
        # check the token type to determine what to render
        if (token.type == 'sub')
          args.outputs.sprites << {
            x: lastX,
            y: lastY,
            **SUB_SPRITE
          }
        end

        if (token.type == 'player')
          facingRight = placingRight
          if args.state.player.facing == 'surfacing'
            facingRight = !facingRight
          end
          args.outputs.sprites << {
            x: lastX,
            y: lastY,
            flip_horizontally: facingRight,
            **PLAYER_SPRITE
          }
        end

        if (token.type == 'chip')
          chip = token
          chipSprite = CHIP_SPRITES[chip.level]
          args.outputs.sprites << {
            x: lastX,
            y: lastY,
            angle: chip.angle,
            **chipSprite
          }
        end

        if (token.type == 'blank')
          args.outputs.sprites << {
            x: lastX,
            y: lastY,
            **EMPTY_CHIP_SPRITE
          }
        end

        if (token.type == 'chip-stack')
          # todo
        end
      end
    end

    # oxygen selection
    if (args.state.selection == :oxygen)
      args.outputs.borders << {
        x: 40, y: 615,
        w: 1190, h: 100,
        r: 0,
        g: 255,
        b: 0
      }
    end

    # board selection
    if (args.state.selection == :board)
      args.outputs.borders << {
        x: 40, y: 290,
        w: 1190, h: 325,
        r: 0,
        g: 255,
        b: 0
      }
    end

    # draw bag
    bagBorder = {r: 0, g: 0, b: 0}
    if (args.state.selection == :bag)
      bagBorder = {r: 0, g: 255, b: 0}
    end
    args.outputs.labels << {
      x: 50,
      y: 280,
      text: "Bag",
      size_enum: 4
    }
    args.outputs.borders << {
      x: 50,
      y: 50,
      w: 400,
      h: 200,
      **bagBorder
    }

    # draw controls
    if (args.state.turnState == :Start)
      rgb = {r: 0, g: 0, b: 0}
      if (args.state.selection == :start)
        rgb = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **FIRST_BUTTON_LABEL,
        text: "Start Game",
      }
      args.outputs.borders << {
        **FIRST_BUTTON_BORDER,
        **rgb
      }
    end

    if (args.state.turnState == :Roll)
      rollRGB = {r: 0, g: 0, b: 0}
      if (args.state.selection == :roll)
        rollRGB = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **FIRST_BUTTON_LABEL,
        text: "Roll Dice",
      }
      args.outputs.borders << {
        **FIRST_BUTTON_BORDER,
        **rollRGB
      }
    end

    if (args.state.turnState == :SearchChip)
      searchRGB = {r: 0, g: 0, b: 0}
      if (args.state.selection == :continue)
        searchRGB = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **FIRST_BUTTON_LABEL,
        text: "Continue",
      }
      args.outputs.borders << {
        **FIRST_BUTTON_BORDER,
        **searchRGB
      }

      pickupRGB = {r: 0, g: 0, b: 0}
      if (args.state.selection == :pickup)
        pickupRGB = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **SECOND_BUTTON_LABEL,
        text: "Pick up",
      }
      args.outputs.borders << {
        **SECOND_BUTTON_BORDER,
        **pickupRGB
      }
    end

    if (args.state.turnState == :SearchBlank)
      searchRGB = {r: 0, g: 0, b: 0}
      if (args.state.selection == :continue)
        searchRGB = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **FIRST_BUTTON_LABEL,
        text: "Continue",
      }
      args.outputs.borders << {
        **FIRST_BUTTON_BORDER,
        **searchRGB
      }

      dropRGB = {r: 0, g: 0, b: 0}
      if (args.state.selection == :drop)
        dropRGB = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **SECOND_BUTTON_LABEL,
        text: "Drop Piece",
      }
      args.outputs.borders << {
        **SECOND_BUTTON_BORDER,
        **dropRGB
      }
    end

    if (args.state.turnState == :ReduceAir)
      rgb = {r: 0, g: 0, b: 0}
      if (args.state.selection == :confirm)
        rgb = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **FIRST_BUTTON_LABEL,
        text: "Reduce Air",
      }
      args.outputs.borders << {
        **FIRST_BUTTON_BORDER,
        **rgb
      }
    end

    if (args.state.turnState == :Turn)
      continueRGB = {r: 0, g: 0, b: 0}
      if (args.state.selection == :continue)
        continueRGB = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **FIRST_BUTTON_LABEL,
        text: "Continue Diving",
      }
      args.outputs.borders << {
        **FIRST_BUTTON_BORDER,
        **continueRGB
      }

      turnRGB = {r: 0, g: 0, b: 0}
      if (args.state.selection == :turn)
        turnRGB = {r: 0, g: 255, b: 0}
      end
      args.outputs.labels << {
        **SECOND_BUTTON_LABEL,
        text: "Turn Around",
      }
      args.outputs.borders << {
        **SECOND_BUTTON_BORDER,
        **turnRGB
      }
    end

    # draw the readout
    args.outputs.borders << {
      **READOUT_BORDER
    }
    readoutSplit = String.wrapped_lines args.state.readout,
                                        50
    args.outputs.labels << readoutSplit.map_with_index do |line, index|
      {
        **READOUT_LABEL,
        y: READOUT_LABEL.y - (index*24),
        text: line
      }
    end

    if args.state.readout != args.state.lastReadout
      # clear any wait between announcements
      args.outputs.a11y_clear_pending_notifications!

      # announce any new readout
      args.outputs.a11y[:readout] = {
        a11y_text: args.state.readout,
        a11y_trait: :notification
      }

      args.state.lastReadout = args.state.readout
    end

  end
end
