
require "rubygems"
require "twitter"
require 'google_chart'
require './configure'


name = String.new ARGV[0]

user = Hash.new

#Iterador de Amigos
friends = Twitter.friend_ids(name)

friends.ids.each do |fid|

  f = Twitter.user(fid)

  #Los seguidores de tus amigos
  if (f.protected.to_s != "true")
    user[f.screen_name.to_s] = f.followers_count
  end

end

user.sort_by {|k,v| -v}.each { |user, count| puts "#{user}, #{count}" } 
