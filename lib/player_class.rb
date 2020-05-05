# frozen_string_literal: true

class Player
  def initialize
    @hp = 150
    @mp = 80
    @status = 'Normal'
  end

  attr_accessor :hp
  attr_accessor :mp
  attr_accessor :status

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

    inverter.hp -= damage
    damage
  end

  def heal
    return heal = 0 if @hp == 150

    case rand(6).floor
    when 5
      heal = 10 + rand(6).floor
    else
      heal = 5 + rand(3).floor
    end
    @hp += heal
    @hp = 150 if @hp > 150
    @mp -= 10
    heal
  end

  def weaken(inverter)
    inverter.status = 'Weakened'
  end

  def clear
    @status = 'Normal'
  end

  def forfeit
    @hp = 0
  end

  def inb4(inverter)
    inverter.hp = 0
  end
end
