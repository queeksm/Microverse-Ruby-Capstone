# frozen_string_literal: true

require_relative './player_class'

class Inverter
  def initialize
    @hp = 400
    @mp = 0
    @status = 'Normal'
  end

  attr_accessor :hp
  attr_accessor :hp
  attr_accessor :status

  def attack(player)
    roll = rand(6).floor
    if player.Status == 'Weakened'
      case roll
          when 5
            damage = 20 + rand(12).floor        
          when 4
            damage = 10 + rand(6).floor
          else
            damage = 0
      end
    else 
      case rand(6).floor
          when 5
            damage = 10 + rand(6).floor
            player.Status = 'Weakened'
          when 4
            damage = 5 + rand(3).floor
          when 3
            damage = 3 + rand(2).floor
          else
            damage = 0
      end
    end
    player.hp -= damage
    return damage
  end
end
