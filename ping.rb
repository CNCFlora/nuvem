#!/usr/bin/env ruby

require 'small-setup'

r = http_get("#{@etcd}/v2/keys/#{@prefix}?recursive=true")
data = nodes2obj(r["node"]["nodes"],"/")

data.keys.each {|k|
    val = data[k]
    if val.has_key?("host") && val.has_key?("port") then
        puts "Ping #{val["name"]}"
        url = "http://#{val["host"]}:#{val["port"]}"
        puts url
        Net::HTTP.get(URI(url))
        puts "ok"
    end
}

puts "Done."

