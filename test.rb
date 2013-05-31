#!/usr/bin/env ruby

require 'net/http'
require 'json'

uri = URI('http://swoop.startupweekend.org/events')
params = { :vertical => 'hardware' }
uri.query = URI.encode_www_form(params)

res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)
