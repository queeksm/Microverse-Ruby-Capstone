class Player
  def initialize
    @HP = 150
    @MP = 80
    @Status = "Weakened"
  end

  attr_accessor :HP
  attr_accessor :MP
  attr_accessor :Status

  def Attack(inverter)
    if inverter.Status == "Weakened"
      case rand(6).floor
      when 5
        damage = 30 + rand(18).floor        
      else
        damage = 10 + rand(6).floor
      end
    else 
      damage = 10 + rand(6).floor
    end
    inverter.HP -= damage
    return damage
  end

  def Heal
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
    if @HP > 150
      @HP = 150
    end
    @MP -= 10
    return heal
  end

  def Weaken(inverter)
    inverter.Status = "Weakened"
  end

  def Clear
   @Status = "Normal"
  end

  def Forfeit
    @HP = 0
  end

  def INB4(inverter)
    inverter.HP = 0
  end
end