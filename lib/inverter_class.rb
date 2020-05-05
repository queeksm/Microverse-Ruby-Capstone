# frozen_string_literal: true

require_relative './player_class'

class Inverter
  def initialize
    @hp = 400
    @mp = 0
    @status = 'Normal'
  end

  attr_accessor :hp
  attr_accessor :mp
  attr_accessor :status

  def attack(player)
    roll = rand(6).floor
    bonus = rand(6).floor if player.status == "Weakened"
    case roll
    when 5
      damage = damage = 10 + rand(6).floor + bonus
      player.Status = 'Weakened'        
    when 4
      damage = 10 + rand(6).floor + bonus
    else
      damage = 0
    end
    player.hp -= damage
    return damage
  end
end
