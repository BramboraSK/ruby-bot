require 'discordrb'
require 'yaml'

config = YAML.load_file('config.yaml')
bot = Discordrb::Commands::CommandBot.new(token: config["token"], prefix: config["prefix"], intents: [:servers, :server_messages, :server_voice_states])

bot.register_application_command(:ftyp, "So true XD", server_id: "835534125544112189") do |cmd|
    cmd.string("ftyp", "Ktory ftyp chces poslat.", required: true)
    cmd.boolean("pridat_xd", "Ci sa ma na koniec pridat XD.", required: true)
end

bot.application_command(:ftyp) do |event|
    event.options["ftyp"] += " XD" if event.options["pridat_xd"]
    event.respond(content: event.options["ftyp"])
end

bot.command(:pripoj_sa) do |event|
    channel = event.user.voice_channel
    next "Nejsi vo VC!" unless channel
  
    bot.voice_connect(channel)
    "Pripojil som sa do: #{channel.name}"
end

bot.command(:so_true) do |event|
    event.voice.play_file('puntos.mp3')
end

bot.run