require 'discordrb'
require 'yaml'

config = YAML.load_file('config.yaml')
bot = Discordrb::Commands::CommandBot.new(token: config["token"], prefix: config["prefix"], intents: [:servers, :server_messages, :server_voice_states])

bot.command(:pripoj_sa) do |event|
    channel = event.user.voice_channel
    next "Nejsi vo VC!" unless channel
  
    bot.voice_connect(channel)
    "Pripojil som sa do: #{channel.name}"
end

bot.command(:so_true) do |event|
    event.voice.play_file('testing/puntos.mp3')
end

Dir["./commands/*.rb"].each { |command|
    require command
    run(bot, config)
}

bot.run