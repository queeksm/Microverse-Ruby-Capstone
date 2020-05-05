# frozen_string_literal: true

# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/MethodLength
# rubocop: disable Metrics/PerceivedComplexity

require_relative './Player'

class MessageProcessor #:nodoc: all

  def poster(message,player,inverter)

    case message.text
      when '/Attack'
        return "You attacked for #{player.Attack(inverter)} damage"
      when '/Weaken'
        player.Weaken(inverter)
        return 'You have weakened the Inverter'
      when '/Heal'
        player.Heal
        return "You healed #{player.Heal} HP you HP now is #{player.HP}"
      when '/Forfeit'
        player.Forfeit
        return 'You surrendered, you curl on the floor and await for the sweet relese of death'
      when '/Status'
        player.Clear
        return "You checked your stats and healed your stat afflictions, you have #{player.HP} HP and #{player.MP} MP, the inverter has #{inverter.HP} HP and it's status is #{inverter.Status}"
      when '/InstaG1BN4O'
        player.INB4(inverter)
        return 'L33T 5UP4 H4X0R !!!!'
      else 'I dont recognize that command'
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

# rubocop: enable Metrics/AbcSize
# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/PerceivedComplexity
