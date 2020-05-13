# 💭 Ruby Capstone Project Telegram BOT

This project is part of a series of projects to be completed by students of [Microverse](https://www.microverse.org/ 'The Global School for Remote Software Developers!').

This project consists of creating a telegram Bot that does some simple things.

## 🔮 The Project Brief

The project was created according to the requirements of the Capstone project.
- A bot developed in Ruby
- Recommended platforms: [Slack](https://github.com/slack-ruby/slack-ruby-bot), [Twitter](https://github.com/muffinista/chatterbot), [Telegram](https://github.com/atipugin/telegram-bot-ruby)
- You choose the platform and the functionality of the bot
- The README must include instructions on how to use the bot (how to install it and use it)

## Requirements

This bot requires the following gems:
  -Telegram BOT
It also requires you to have a telegram account.

## 🔨 Installation and execution.

  -Clone the folder using the following line on you terminal: git clone https://github.com/queeksm/Microverse-Ruby-Capstone.git
  
  -Install the gems with the following commands: $ gem install telegram-bot-ruby
  
  -Execute the bot that's within the bin folder: ruby bot.rb

  -You can also initialize the bot within the root folder of the bot by using the following command: ruby bin/bot.rb
  
  -Talk to t.me/inv3rt3r_bot on Telegram and type /start on the chat box.

Bot functionality:

  This bot simulates a small RPG battle using the Telegram API,the bot will calculate certain actions using the chat box and a list of commands that you can use during the battle, both the player and the enemy have an amount of hit points (HP), the player will also have 8 potions that can use at any point to heal itself. The player starts with 150HP and the Inverter(Enemy) starts with 400 HP.

Commands:
  -/Attack to attack the enemy and deal a base amount of damage.
  
  -/Weaken to weaken the enemy this will activate the possibility of dealing critical hits upon the enemy.
  
  -/Heal to heal yourself (Heal consumes 1 potion, so you can only heal 8 times).
  
  -/Status to remove the weakened status and check both your and your enemy HP and potions, the weakened status allows the enemy to hit you critically and deal double damage.
  
  -/Forfeit to surrender.
  
  -/InstaG1BN4O instantly kills the inverter (Test purposes only)

## 🔨 Technologies & Languages Used

- Ruby
- Rspec
- Telegram API
- Rubocop
- Stickler-CI

## 🚀 Our Project

Our project can be found at https://github.com/queeksm/Microverse-Ruby-Capstone

## 🦄 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/queeksm/Microverse-Ruby-Capstone/issues).

1. Fork it (https://github.com/queeksm/Microverse-Ruby-Capstone/fork)
2. Create your working branch (git checkout -b [choose-a-name])
3. Commit your changes (git commit -am 'what this commit will fix/add/improve')
4. Push to the branch (git push origin [chosen-name])
5. Create a new Pull Request

## 👨🏽‍💻 👨🏿‍💻 Creators

Andres Perez - [GitHub](https://github.com/queeksm)

## 🖐️ Show Your Support

Give a ⭐️ if you like this project!

## ⚖️ Licensing

This project is [MIT](https://github.com/queeksm/Microverse-Ruby-Capstone/LICENSE.txt) licensed.
