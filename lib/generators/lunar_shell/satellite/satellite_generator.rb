module LunarShell
  class SatelliteGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    class_option :include_test, aliases: '-t', desc: 'Include test file'

    def copy_satellite_files
      template 'controller.rb', controller_path
      template 'view.rb', view_path
      template 'test.rb', test_path if options[:include_test]
    end

    def add_route
      satellite_route singular_name
    end

    private

    def base_path(type)
      "app/#{type}/lunar_shell/satellites/#{singular_name}"
    end

    def controller_path
      "#{base_path :controllers}_controller.rb"
    end

    def test_path
      "test/integration/#{singular_name}_test.rb"
    end

    def view_path
      "#{base_path :views}/run.js.erb"
    end

    def satellite_route(name)
      route = "resource :#{name}, only: []\n"
      log :route, route.strip

      scopes = [{sentinel: /\.routes\.draw do\s*\n/m}]

      mp = LunarShell::Engine.mount_path.gsub(/^\//, '')
      scopes << satellite_scope("scope :#{mp}", scopes.count) if mp.present?

      ["scope module: :lunar_shell", 'namespace :satellites'].each do |name|
        scopes << satellite_scope(name, scopes.count)
      end

      scopes << { name: "#{'  ' * scopes.count}#{route}" }

      in_root do
        scopes.drop(1).each_with_index do |scope, i|
          content = File.binread("#{destination_root}/config/routes.rb")
          next if content =~ scope[:sentinel]
          inject_into_file 'config/routes.rb',
            scope[:name],
            after: scopes[i][:sentinel],
            verbose: false
        end
      end
    end

    def satellite_scope(name, level = 0)
      spaces = '  ' * level
      scope_start = "#{spaces}#{name} do\n"
      scope_end = "#{spaces}end\n"
      {
        name: "#{scope_start}#{scope_end}",
        sentinel: /^#{scope_start}/m
      }
    end
  end
end
