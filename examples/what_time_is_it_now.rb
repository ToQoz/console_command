CC.define_command('what-time-is-it-now') do |c|
  c.description "display current time"
  c.group "Joke"
  c.options do |opts|
    opt.banner unindent <<-USAGE
      Usage: what-time-is-it-now

      display what-time-is-it-now
    USAGE
  end
  c.process do
    puts Time.now
  end
end
