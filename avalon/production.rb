Avalon::Application.configure do
  config.action_controller.asset_host = ENV['ASSET_HOST'] || Avalon::Configuration.lookup('domain.host')
  config.action_controller.perform_caching = true
  config.active_support.deprecation = :notify
  config.assets.compile = false
  config.assets.compress = true
  config.assets.digest = true
  config.assets.precompile += %w( access_control_step.js android_pre_play.js autocomplete.js avalon_player.js 
    avalon_playlists/playlist_items.js avalon_progress.js datatables_bootstrap.css dropdown_text_fields.js 
    dynamic_fields.js embed.css embed_player.js file_browse.js file_table.js file_upload_step.js 
    font-awesome.css import_button.js jasny-bootstrap.min.css jasny-bootstrap.min.js jquery-ui/datepicker.css 
    jquery.dataTables.bootstrap.js jquery.dataTables.min.js jquery.xmleditor.css marker.js 
    me-add-to-playlist.css me-add-to-playlist.js me-logo.css me-thumb-selector.css me-thumb-selector.js 
    mediaelement-hd-toggle/mejs-hdtoggle.css mediaelement-hd-toggle/mep-feature-hdtoggle.js 
    mediaelement-qualityselector/mep-feature-qualities.css mediaelement-qualityselector/mep-feature-qualities.js 
    mediaelement-skin-avalon/mejs-skin-avalon.css mediaelement-skin-avalon/mep-feature-responsive.js 
    mediaelement-title/mejs-title.css mediaelement_rails/mediaelement-and-player.js 
    mediaelement_rails/mediaelementplayer.css modernizr.js select_all.js sort_streams.js xmleditor/ace.js 
    xmleditor/jquery.xmleditor.js xmleditor/mode-xml.js xmleditor/vkbeautify.js xmleditor/xsd2json.js 
    mediaelement_rails/flashmediaelement.swf )
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.eager_load = true
  config.i18n.fallbacks = true
  config.serve_static_assets = false
end
