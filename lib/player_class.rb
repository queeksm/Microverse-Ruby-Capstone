# frozen_string_literal: true

class Player

  def initialize
    @hp = 150
    @mp = 80
    @status = 'Weakened'
  end

  attr_accessor :hp
  attr_accessor :mp
  attr_accessor :status

  def attack(inverter)
    roll = rand(6).floor
    bonus = rand(10).floor if inverter.status == "Weakened"
    case roll
    when 5
      damage = 30 + rand(18).floor        
    else
      damage = 10 + rand(6).floor
    end

    inverter.HP -= damage
    return damage
  end

  def heal
    if @HP == 150
      heal = 0
    else
      case rand(6).floor
        when 5
          heal = 10 + rand(6).floor
        else
          heal = 5 + rand(3).floor
      end
    end
    @HP += heal
    @HP = 150 if @HP > 150
    @MP -= 10
    return heal
  end

  def weaken(inverter)
    inverter.Status = 'Weakened'
  end

  def clear
   @Status = 'Normal'
  end

  def forfeit
    @HP = 0
  end

  def iNB4(inverter)
    inverter.HP = 0
  end
end
