require "net/http"
# get url protocol and host, port, path
uri = URI.parse("https://notify-api.line.me/api/notify")

# create Net::HTTP object
http = Net::HTTP.new(uri.host, uri.port,"127.0.0.1", 8080)

# Set using SSL/TLS, default is not using SSL/TLS
http.use_ssl = true

# Do not request or return certification, if verification was failed, continue hand shack
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# Create Post request
req = Net::HTTP::Post.new(uri.path)

# Get Token value from environment
token = "Bearer #{ENV["LINE_TOKEN"]}"

# Set header
req['Authorization'] = token

# define data by multipart/form-data 
data = [
    ["message", "hoge"],
  ]

# Set data
req.set_form(data, "multipart/form-data")

# send request
res = http.request(req)



