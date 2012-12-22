# -*- coding: utf-8 -*-

require 'active_support'
require 'console_command/command'
require 'console_command/railtie'

module ConsoleCommand
  extend self
  delegate :define_command, :to => :Command
end
CC = ConsoleCommand
