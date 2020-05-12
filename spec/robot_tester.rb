# frozen_string_literal: true

require_relative '../lib/player_class'
require_relative '../lib/inverter_class'

RSpec.describe Player do
  
  player = Player.new
  inverter = Inverter.new

  inverter.status = 'Normal'

  describe "#attack" do
    it 'Receives a inverter object and deals a random amount of damage to the HP attribute' do
      expect(player.attack(inverter)).to be <= 39
      expect(player.attack(inverter)).to be >= 10
    end

    it 'Has a chance to deal a critical strike when the status is weakened' do
      inverter.status = "Weakened"
      expect(player.attack(inverter)).to be <= 58
      expect(player.attack(inverter)).to be >= 10
    end
  end

  describe "#heal" do
    it 'Heals a small amount of health after consuming a potion' do      
      player.damager(110)
      player.heal
      expect(player.hp).to be > 40
      expect(player.potions).to be == 7
    end

    it 'Will heal for 0 HP if the player HP is 150, however it will consume a potion' do      
      player.healer(150)      
      expect(player.heal).to be == 0
      expect(player.hp).to be == 150
      expect(player.potions).to be == 6
    end
  end

  describe "#weaken" do
    it 'Change the status of the Inverter object to Weakened' do
      player.weaken(inverter)
      expect(inverter.status).to be == 'Weakened'
    end
  end

  describe "#clear" do
    it 'Changes the player status from Weakened to Normal' do
      player.wknd
      expect(player.status).to be == 'Weakened'
      player.clear
      expect(player.status).to be == 'Normal'
    end
  end

  describe "#forfeit" do
    it 'Places the player on the status Curling, this status allows the inverter object to deal 9999 damage to the player in his turn' do
      player.forfeit
      expect(player.status).to be == 'Curling'
      expect(inverter.attack(player)).to be == 9999
    end
  end
end

RSpec.describe Inverter do
  player = Player.new
  inverter = Inverter.new

  describe "#attack" do
    it 'Attacks the player dealing a random ammount of damage' do
      expect(inverter.attack(player)).to be <= 20
      expect(inverter.attack(player)).to be >= 0
    end

    it 'Deals 9999 damage to the player if the status is Curling' do
      player.forfeit
      expect(inverter.attack(player)).to be == 9999
    end
  end
end




