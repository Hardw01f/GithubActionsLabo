require "net/http"

uri = URI.parse("https://notify-api.line.me/api/notify")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
req = Net::HTTP::Post.new(uri.path)

token = "Bearer #{ENV["LINE_TOKEN"]}"
req['Authorization'] = token
data = [
    ["message", "This is scheduled message"],
  ]

req.set_form(data, "multipart/form-data")
res = http.request(req)

puts res.code


