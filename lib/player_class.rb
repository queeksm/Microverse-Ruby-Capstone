# frozen_string_literal: true

class Player
  def initialize
    @hp = 150
    @potions = 8
    @status = 'Normal'
  end

  attr_reader :hp
  attr_reader :potions
  attr_reader :status

  def attack(inverter)
    roll = rand(6).floor
    bonus = 0
    bonus = rand(10).floor if inverter.status == 'Weakened'
    case roll
    when 5
      damage = 30 + rand(18).floor + bonus
    else
      damage = 10 + rand(6).floor + bonus
    end
    inverter.damager(damage)
    damage
  end

  def heal
    @hp = 150 if @hp > 150
    @potions -= 1
    return heal = 0 if @hp == 150

    case rand(6).floor
    when 5
      heal = 10 + rand(6).floor
    else
      heal = 5 + rand(3).floor
    end
    @hp += heal    
    heal
  end

  def weaken(inverter)
    inverter.wknd
  end

  def clear
    @status = 'Normal'
  end

  def forfeit
    @status = 'Curling'
  end

  def inb4(inverter)
    inverter.hp = 0
  end

  def wknd
    @status = "Weakened"
  end

  def damager(num)
    @hp -= num
  end

  def healer(num)
    @hp += num
  end
end
