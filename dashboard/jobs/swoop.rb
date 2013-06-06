require 'net/http'
require 'json'

current_valuation = 0
SCHEDULER.every '20s' do |job|
  uri = URI('http://swoop.startupweekend.org/events')
  params = { :vertical => 'hardware', :event_status => 'G' }
  uri.query = URI.encode_www_form(params)
  res = Net::HTTP.get_response(uri)

  if res.is_a?(Net::HTTPSuccess)
    json = JSON.parse(res.body)

#    tweets.map! do |tweet| 
#      { name: tweet['from_user'], body: tweet['text'], avatar: tweet['profile_image_url_https'] }
#    end
  
    last_valuation = current_valuation
    current_valuation = rand(100)

    send_event('valuations', { current: current_valuation, last: last_valuation })
    send_event('swoop_event', { count: json.count, raw: json })
  end

  #send_event('swoop_event', { current: current_valuation, last: last_valuation, count: rand(100) })
end
