# frozen_string_literal: true

require_relative './player_class'

class MessageProcessor
  def poster(message, player, inverter)
    rules = "You're nothing more than a farmer, during one of your not so exciting foraging runs you hear a scream on the depths of the forest." \
            'Against everything that your parents have taught you through the years, you run at the sound to find a grim scene.' \
            'An adventurer lies next to a fallen tree bloodied and heavily injured, a couple of meters away you can distinguish a figure.' \
            'A towering giant, armed with a brutish looking weapon that you cannot fully identify. The injured adventurer gives you his sword and 8 potions' \
            'and commends you with the monumental task of taking down the giant. His voice is clear and you listen to it with all your attention.' \
            'Use the sword to attack the giant using the /Attack command on the chat box, be careful his attacks can weaken you, and when weakened ' \
            'the giant has a chance to hit you for twice as much damage however i can clean the weakening with my magic, i can do this if you type /Status on ' \
            "the chat box, also i'll give you some information about your health, your potions and the monster's remaining health. The eyes of the monster" \
            "are injured, thanks to that he'll miss some of his attacks, however you must be careful and not get so confident. The sword i just gave you can " \
            'weaken the beast, this will not damage it directly but will allow you to hit it for twice the damage sometimes, you can call this powe by typing  /Weaken on the chat box. Also if you feel that this quest ' \
            "is way to much to handle you can type /Forfeit and the monster will finish you with it's next attack."

    case message.text
    when '/Attack'
      "You attacked for #{player.attack(inverter)} damage"
    when '/Weaken'
      player.weaken(inverter)
      'You have weakened the Inverter'
    when '/Heal'
      player.heal
      "You healed #{player.heal} HP using a potion you HP now is #{player.hp}, you have #{player.potions} potions remaining"
    when '/Forfeit'
      player.forfeit
      'You surrendered, you curl on the floor and await for the sweet relese of death'
    when '/Status'
      player.clear
      "You checked your stats and healed your stat afflictions, you have #{player.hp} HP and #{player.potions} potions, the inverter has #{inverter.hp} HP and it's status is #{inverter.status}"
    when '/InstaG1BN4O'
      player.inb4(inverter)
      'L33T 5UP4 H4X0R !!!!'
    when '/Rules'
      rules
    else 'I dont recognize that command'
    end
  end

  def inverter_action(player, inverter)
    damage = inverter.attack(player)
    return 'The inverter executes you without pity or remorse.' if damage == 9999

    return "The inverter misses it's attack, the mistress of fortune smiles to you today." if damage.zero?

    "The inverter hits you for #{damage}"
  end
end
