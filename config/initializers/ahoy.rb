class Ahoy::Store < Ahoy::DatabaseStore
end
Ahoy.visit_duration = 2.minutes
# set to true for JavaScript tracking
Ahoy.api = true
Ahoy.user_agent_parser = :device_detector
Ahoy.track_bots = true 