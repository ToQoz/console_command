CC.define_command('show-controllers') do |c|
  c.description "show all controllers"
  c.group "RailsController"
  c.options do |opts|
    opt.banner unindent <<-USAGE
      Usage: show-controllers

      show all controllers
    USAGE
  end
  c.process do
    Rails.application.eager_load!
    puts ApplicationController.descendants
  end
end
