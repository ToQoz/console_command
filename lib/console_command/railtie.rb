# -*- coding: utf-8 -*-

module ConsoleCommand
  class Railtie < Rails::Railtie
    console do
      command_glob = Rails.root.join('config/console_command/*.rb')

      Dir[command_glob].each do |command|
        require command
      end
    end
  end
end
