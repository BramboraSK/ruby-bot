require 'httparty'

def run(bot, config)
    bot.register_application_command(:ruby, "Pecka Ruby GIF", server_id: "835534125544112189") do |cmd|
        cmd.string("query", "Aky Ruby GIF mam poslat.")
    end
    
    bot.application_command(:ruby) do |event|
        res = HTTParty.get("https://g.tenor.com/v1/search?q=#{"ruby kurosawa " + (event.options["query"] || "")}&key=#{config["key"]}&limit=#{event.options["query"] ? "10" : "50"}")
        
        if res.code == 200
            if res.parsed_response["results"][0].nil?
                event.respond(content: "No results!")
            else
                event.respond(content: res.parsed_response["results"].sample["url"])
            end
        else
            event.respond(content: "Error!")
        end
    end
end