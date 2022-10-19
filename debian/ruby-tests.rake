load 'Rakefile'

yamlers=\
  case RUBY_VERSION
  when /1\.8/
    [""]
  when /1\.9/
    ["psych", "syck"]
  else # 2.0
    ["psych"]
  end

yamlers.each do |yamler|
  ENV["YAMLER"]=yamler
  Rake::Task['spec'].invoke
end

task :default => nil
