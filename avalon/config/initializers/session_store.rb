# https://github.com/avalonmediasystem/avalon-docker/issues/19 
Avalon::Application.config.session_store :active_record_store, httponly: true
