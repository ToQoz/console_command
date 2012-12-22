# -*- coding: utf-8 -*-

module ConsoleCommand
  class Command

    class << self
      def define_command(name)
        command = new(name.to_s)
        yield command
        command.add_to_irb_command
        command.add_to_pry_command if defined? Pry
      end
    end

    [ :name, :description, :group, :options, :process ].each do |name|
      define_method(name) do |value = nil, &block|
        if value
          instance_variable_set "@#{name}", value
        elsif block
          instance_variable_set "@#{name}", block
        else
          attrribute = instance_variable_get "@#{name}"
          attrribute.respond_to?(:call) ? attrribute.call : attrribute
        end
      end
    end

    def initialize(name)
      @name = name
    end

    def add_to_pry_command
      command = self
      command_sets = Pry::CommandSet.new
      command_sets.create_command(name) do
        group command.group
        description command.description
        define_method(:process) do
          command.process
        end
        define_method(:options) do |opts|
          command.options opts
        end
      end
      Pry.commands.import command_sets
    end

    def add_to_irb_command
      require 'irb'
      require 'irb/cmd/nop'
      command = self
      command_class = Class.new IRB::ExtendCommand::Nop do
        define_method :execute do
          command.process
        end
      end
      irb_cmd_name = name.gsub('-', '_')
      class_name = irb_cmd_name.to_s.classify
      IRB::ExtendCommand.const_set class_name, command_class
      IRB::ExtendCommandBundle.def_extend_command irb_cmd_name, class_name
    end
  end
end
