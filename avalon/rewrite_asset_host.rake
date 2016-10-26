require 'sprockets/rails/task'

namespace :assets do
  task :rewrite_asset_host => :environment do
    string_asset = Class.new(Sprockets::Asset) do
      def initialize(environment, logical_path, asset_dir, content)
        @root         = environment.root
        @source       = content
        @logical_path = logical_path.to_s
#        @content_type = environment.content_type_of(logical_path)
        @mtime        = Time.now
        @length       = Rack::Utils.bytesize(source)
        @digest       = environment.digest.update(source).hexdigest
        @pathname     = Pathname.new(File.expand_path(File.join(asset_dir, digest_path)))
      end
      
      def source
        @source
      end
    end

    sprocket = Sprockets::Rails::Task.new(Avalon::Application)
    manifest = sprocket.manifest
    stylesheets = manifest.assets.keys.select { |k| k =~ /\.css$/ }
    stylesheets.each do |stylesheet|
      digest_path = manifest.assets[stylesheet]
      content = File.read(File.join(manifest.dir, digest_path))
      if content =~ /__ASSET_HOST__/
        content.gsub!(/__ASSET_HOST__/, Avalon::Application.config.action_controller.asset_host)
        asset = string_asset.new(sprocket.environment, stylesheet, manifest.dir, content)
        asset.write_to(asset.pathname)
        asset.write_to("#{asset.pathname}.gz")
        manifest.files[asset.digest_path] = { 
          'logical_path' => asset.logical_path, 
          'mtime' => asset.mtime.iso8601, 
          'size' => asset.bytesize, 
          'digest' => asset.digest 
        }
        manifest.assets[asset.logical_path] = asset.digest_path
        manifest.remove(digest_path)
      end
    end
  end
end
