# frozen_string_literal: true

require_relative './playerClass'

class Inverter
  def initialize
    @HP = 400
    @MP = 0
    @Status = 'Normal'
  end

  attr_accessor :HP
  attr_accessor :MP
  attr_accessor :Status

  def attack(player)

    if player.Status == 'Weakened'
      case rand(6).floor
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
    player.HP -= damage
    return damage
  end
end
