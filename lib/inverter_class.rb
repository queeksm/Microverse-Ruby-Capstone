# frozen_string_literal: true

require_relative './player_class'

class Inverter
  def initialize
    @hp = 400
    @status = 'Normal'
  end

  attr_accessor :hp
  attr_accessor :status

  def attack(player)
    if player.status == 'Curling'
      damage = 9999
      player.damager(damage)
      return damage
    end
    roll = rand(6).floor
    bonus = 0
    bonus = rand(6).floor if player.status == 'Weakened'
    case roll
    when 5
      damage = 10 + rand(6).floor + bonus
      player.wknd
    when 4
      damage = 10 + rand(6).floor + bonus
    else
      damage = 0
    end
    player.damager(damage)
    damage
  end

  def wknd
    @status = 'Weakened'
  end

  def damager(num)
    @hp -= num
  end
end
