# frozen_string_literal: true

require_relative './player_class'

class MessageProcessor

  def poster(message,player,inverter)

    case message.text
      when '/Attack'
        return "You attacked for #{player.attack(inverter)} damage"
      when '/Weaken'
        player.weaken(inverter)
        return 'You have weakened the Inverter'
      when '/Heal'
        player.heal
        "You healed #{player.heal} HP you HP now is #{player.HP}"
      when '/Forfeit'
        player.forfeit
        return 'You surrendered, you curl on the floor and await for the sweet relese of death'
      when '/Status'
        player.clear
        return "You checked your stats and healed your stat afflictions, you have #{player.HP} HP and #{player.MP} MP, the inverter has #{inverter.HP} HP and it's status is #{inverter.Status}"
      when '/InstaG1BN4O'
        player.iNB4(inverter)
        return 'L33T 5UP4 H4X0R !!!!'
      else 'I dont recognize that command'
    end
  end

  def inverter_action(player,inverter)

    damage = inverter.attack(player)
    if damage == 0
      return "The inverter misses it's attack, the mistress of fortune smiles to you today."
    else
      return "The inverter hits you for #{damage}"
    end
  end
end
