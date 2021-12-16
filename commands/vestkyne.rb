def run(bot, config)
    bot.register_application_command(:vestkyne, "Vyvesti ti OSUd", server_id: "835534125544112189") do |cmd|
        cmd.string("otazka", "Tvoje otazka.", required: true)
    end
    
    answer = ["Ano", "Ne", "Smrdis"]

    bot.application_command(:vestkyne) do |event|
        event.respond(content: "#{event.user.username} se zeptal na otazku: #{event.options["otazka"] }\nMa odpoved je: #{answer.sample}.")
    end
end