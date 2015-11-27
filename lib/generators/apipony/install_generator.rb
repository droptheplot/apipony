require 'rails/generators/base'

module Apipony
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../install/templates', __FILE__)

      def copy_initializer
        template 'initializer.rb', 'config/initializers/apipony.rb'
      end

      def mount_engine
        insert_into_file "#{Rails.root}/config/routes.rb", :after => /routes.draw.do\n/ do
          %Q{  mount Apipony::Engine => '/apipony'
}
        end
      end
    end
  end
end
