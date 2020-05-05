# frozen_string_literal: true

# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/MethodLength
# rubocop: disable Metrics/PerceivedComplexity

require_relative './Player'

class Inverter #:nodoc: all
  def initialize
    @HP = 400
    @MP = 0
    @Status = 'Normal'
  end

  attr_accessor :HP
  attr_accessor :MP
  attr_accessor :Status

  def Attack(player)

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

# rubocop: enable Metrics/AbcSize
# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/PerceivedComplexity
