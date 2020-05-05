# frozen_string_literal: true

require 'telegram/bot'
require_relative './messageProcessor'
require_relative './playerClass'
require_relative './inverterClass'

class inverter_bot

  attr_accessor :player
  attr_accessor :Inverter
  def initialize
    @player = Player.new
    @inverter = Inverter.new
    token = '1246568776:AAExeeOnv7oeBTEIv4cJ_K0HaITwz0B1Dp4'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen { |message| command(bot, message) }
    end
  end

  def command(bot, message)

    message_processor = MessageProcessor.new
    if message.text == '/start'
      bot.api.send_message(chat_id: message.chat.id, text: 'Welcome, i hope you have fun with this small fight')
      bot.api.send_message(chat_id: message.chat.id, text: 'You can read all the commands on the Readme or you can type /Rules for a recap')       
    elsif message.text == '/Rules'
      bot.api.send_message(chat_id: message.chat.id, text: '/Attack for attacks, /Weaken to weaken the enemy, /Heal for heal, /Status for weaken removal, /Forfeit to surrender') 
    elsif message.text == '/Attack' || message.text == '/Weaken' || message.text == '/Heal' || message.text == '/Status' || message.text == '/Forfeit' || message.text == '/InstaG1BN4O'
      sleep(1)
      bot.api.send_message(chat_id: message.chat.id, text: "#{message_processor.poster(message, @player, @inverter)}")
      sleep(1)
      bot.api.send_message(chat_id: message.chat.id, text: "#{message_processor.Inverter_action(@player, @inverter)}")
      if player.Status == 'Weakened'
        bot.api.send_message(chat_id: message.chat.id, text: "You're weakened be careful")
      end
      if @player.HP <= 0
        bot.api.send_message(chat_id: message.chat.id, text: 'YOU DIED')
        sleep(0.5)
        bot.api.send_message(chat_id: message.chat.id, text: "I'll now reset the encounter.")
        @player = Player.new
        @inverter = Inverter.new
      elsif @inverter.HP <= 0 && @player.HP.positive?
        bot.api.send_message(chat_id: message.chat.id, text: 'YOU WON')
        sleep(0.5)
        bot.api.send_message(chat_id: message.chat.id, text: 'The bards will sang about this encounter for the ages to come.')
        sleep(0.5)
        bot.api.send_message(chat_id: message.chat.id, text: "However, this foul creature is always waiting for it's next prey")
        @player = Player.new
        @inverter = Inverter.new
      end
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Sorry I don't recognize that command")
    end
  end
end
