module LunarShell
  class SatelliteGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def copy_satellite_files
      template 'controller.rb', controller_path
      template 'view.rb', view_path
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

    def view_path
      "#{base_path :views}/run.js.erb"
    end

    def satellite_route(name)
      route    = "      resource :#{name}, only: []\n"
      log :route, route.strip

      sentinel = /\.routes\.draw do\s*\n/m

      ls_start = "  scope module: :lunar_shell do\n"
      ls_end = "  end\n"
      ls_str = "#{ls_start}#{ls_end}"
      ls_regex = /^#{ls_start}.*^#{ls_end}/m

      s_start = "    namespace :satellites do\n"
      s_end = "    end\n"
      s_str = "#{s_start}#{s_end}"
      s_regex = /^#{s_start}.*^#{s_end}/m


      in_root do
        content = File.binread("#{destination_root}/config/routes.rb")

        inject_into_file 'config/routes.rb',
          ls_str, { after: sentinel, verbose: false } if !(content =~ ls_regex)

        inject_into_file 'config/routes.rb',
          s_str, { after: ls_start, verbose: false } if !(content =~ s_regex)

        inject_into_file 'config/routes.rb',
          route, { after: s_start, verbose: false }
      end
    end
  end
end
