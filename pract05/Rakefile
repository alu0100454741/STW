desc "run the server"
task :default do
  sh "rackup"
end

desc "run the client with rock"
task :rock do
  sh %q{curl -v 'http://localhost:9292?choice=rock'}
end

desc "run the client with paper"
task :paper do
  sh %q{curl -v 'http://localhost:9292?choice=paper'}
end

desc "run the client with scissors"
task :scissors do
  sh %q{curl -v 'http://localhost:9292?choice=scissors'}
end

desc "Ejecutar tests con Pruebas Unitarias"
task :test do
  sh "ruby -Ilib -Itest test/tc_ppt.rb"
end

desc "Ejecutar tests rspec"
task :spec do
  sh "rspec --format d -Ilib -Ispec spec/rsack/server_spec.rb"
end
