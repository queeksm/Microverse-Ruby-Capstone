require_relative './Player'

class MessageProcessor

  def poster(message,player,inverter)    
    case message.text
      when "/Attack"
        return "you attacked for #{player.Attack(inverter)} damage"
      when "/Weaken"
        player.Weaken(inverter)
        return "You have weakened the Inverter"
      when "/Heal"
        player.Heal  
        return "You healed #{player.Heal} HP you HP now is #{player.HP}"
      when "/Forfeit"
        player.Forfeit
        return "You surrendered, the inverter killed you instantly with it's next attack"
      when "/Status"
        player.Clear
        return "You checked your stats and healed your stat afflictions, you have #{player.HP} HP and #{player.MP} MP, the inverter has #{inverter.HP} HP and it's status is #{inverter.Status}"
      when "/InstaG1BN4O"
        player.INB4(inverter)
        return "L33T 5UP4 H4X0R !!!!"
      else "I dont recognize that command"      
    end
  end

  def Inverter_action(player,inverter)
    damage = inverter.Attack(player)
    if damage == 0
      return "The inverter misses it's attack, the mistress of fortune smiles to you today."
    else
      return "The inverter hits you for #{damage}"
    end
  end
end




# required for the encounter = dice RAND function 1-6
# Player and Inverter class Each class will have 2 main stats HP and MP
# The combat will be turn based. the player will choose an action using /Attack /Heal /Forfeit /Status /InstaG1BN4O
## /InstaG1BN4O will instantly kill the inverter, testing only.
## /Attack will cause the player to attack the inverter using 3 possible attacks /Heavy /Fast /Weaken
### /Heavy more dmg chance to miss chance to stun when weakened.
### /Fast less dmg lower chance to miss , chance to crit when weakened crit deals 300% dmg.
### /Weaken 0 dmg will cause the weaken status for 3 turns.
## /heal will heal the player a fixed amount plus a roll(1d6) Consumes MP
## /Forfeir will kill the player and instantly end the encounter.
## /Status will show both the player and the Inverter HP/MP and will heal the weaken/stun status this counts as an action
# The bot will instantly answer to the player with the action taken by the Inverter
# The Inverter will attack with a simple pattern and will start healing when it reaches 30% of his HP.
# If the player MP gets to 0 and tries to heal will receive damage equal to the healing roll.
# The inverter attacks have a chance to weaken. Once weakened the player can receive a crit or get stunned.
# If the Player hp gets to 0 the pĺayer will die. Same case for the inverter.
# The player wins if the inverter dies.
