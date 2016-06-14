require 'rails/generators/base'

module Apipony
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../install/templates', __FILE__)

      def copy_initializer
        template 'initializer.rb', 'config/initializers/apipony.rb'
      end

      def mount_engine
        insert_into_file routes_path, after: /routes.draw.do\n/ do
          %(  mount Apipony::Engine => '/apipony'
)
        end
      end

      private

        def routes_path
          "#{Rails.root}/config/routes.rb"
        end
    end
  end
end
