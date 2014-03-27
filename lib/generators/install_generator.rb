require 'rails/generators'
require 'rails/generators/migration'
module Walletone
  
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    
    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    def create_migration_file
      migration_template 'create_walletone_table.rb', 'db/migrate/create_walletone_table.rb'
    end

    def create_initializer_file
      copy_file "walletone_config.rb", Rails.root.join("config", "initializers", "wallet_one.rb")
    end

  end

end
