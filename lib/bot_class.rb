# frozen_string_literal: true

require 'telegram/bot'
require_relative './message_processor'
require_relative './player_class'
require_relative './inverter_class'

class InverterBot
  def initialize
    @player = Player.new
    @inverter = Inverter.new
    token = '1246568776:AAExeeOnv7oeBTEIv4cJ_K0HaITwz0B1Dp4'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen { |message| command(bot, message, @rules) }
    end
  end

  private 

  def command(bot, message, rules)
    message_processor = MessageProcessor.new
    start_rules(bot, message, message_processor, rules)
    checker(bot,message,@player.hp, @inverter.hp)
  end

  private

  def start_rules(bot, message,message_processor, rules)
    if message.text == '/start'
      bot.api.send_message(chat_id: message.chat.id, text: 'Welcome, i hope you have fun with this small fight')
      bot.api.send_message(chat_id: message.chat.id, text: 'You can read all the commands on the Readme or you can type /Rules for a small recap and story')
    elsif message.text == '/Rules'
      bot.api.send_message(chat_id: message.chat.id, text: message_processor.poster(message, @player, @inverter).to_s)    
    elsif message.text == '/Attack' || message.text == '/Weaken' || message.text == '/Heal' || message.text == '/Status' || message.text == '/Forfeit' || message.text == '/InstaG1BN4O'
      combat(bot,message,message_processor)
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Sorry I don't recognize that command")
    end
  end

  private

  def combat(bot, message,message_processor)    
    sleep(1)
    bot.api.send_message(chat_id: message.chat.id, text: "You're weakened be careful") if @player.status == 'Weakened'
    bot.api.send_message(chat_id: message.chat.id, text: message_processor.poster(message, @player, @inverter).to_s)
    sleep(1)
    bot.api.send_message(chat_id: message.chat.id, text: message_processor.inverter_action(@player, @inverter).to_s)
  end

  private

  def checker(bot,message,player_hp,inverter_hp)
    if player_hp <= 0
      bot.api.send_message(chat_id: message.chat.id, text: 'YOU DIED')
      sleep(0.5)
      bot.api.send_message(chat_id: message.chat.id, text: "I'll now reset the encounter.")
      @player = Player.new
      @inverter = Inverter.new
    elsif inverter_hp <= 0 && player_hp.positive?
      bot.api.send_message(chat_id: message.chat.id, text: 'YOU WON')
      sleep(0.5)
      bot.api.send_message(chat_id: message.chat.id, text: 'The bards will sang about this encounter for the ages to come.')
      sleep(0.5)
      bot.api.send_message(chat_id: message.chat.id, text: "However, this foul creature is always waiting for it's next prey")
      @player = Player.new
      @inverter = Inverter.new
    end
  end
end
