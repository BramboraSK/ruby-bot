def run(bot, config)
    bot.register_application_command(:ftyp, "So true XD", server_id: "835534125544112189") do |cmd|
        cmd.string("ftyp", "Ktory ftyp chces poslat.", required: true)
        cmd.boolean("pridat_xd", "Ci sa ma na koniec pridat XD.", required: true)
    end
    
    bot.application_command(:ftyp) do |event|
        event.options["ftyp"] += " XD" if event.options["pridat_xd"]
        event.respond(content: event.options["ftyp"])
    end
end