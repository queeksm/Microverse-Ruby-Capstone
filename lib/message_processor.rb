# frozen_string_literal: true

require_relative './player_class'

class MessageProcessor
  def poster(message, player, inverter)
    case message.text
    when '/Attack'
      "You attacked for #{player.attack(inverter)} damage"
    when '/Weaken'
      player.weaken(inverter)
      'You have weakened the Inverter'
    when '/Heal'
      player.heal
      "You healed #{player.heal} HP you HP now is #{player.hp}"
    when '/Forfeit'
      player.forfeit
      'You surrendered, you curl on the floor and await for the sweet relese of death'
    when '/Status'
      player.clear
      "You checked your stats and healed your stat afflictions, you have #{player.hp} HP and #{player.mp} MP, the inverter has #{inverter.hp} HP and it's status is #{inverter.status}"
    when '/InstaG1BN4O'
      player.iNB4(inverter)
      'L33T 5UP4 H4X0R !!!!'
    else 'I dont recognize that command'
    end
  end

  def inverter_action(player,inverter)

    damage = inverter.attack(player)
    return "The inverter misses it's attack, the mistress of fortune smiles to you today." if damage == 0
    "The inverter hits you for #{damage}"
  end
end
