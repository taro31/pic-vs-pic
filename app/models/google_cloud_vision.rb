class GoogleCloudVision
  
  def initialize
    @description = 0
  end
  
  def get_image
    file_path = Pic.last.image.to_s
    open(file_path) { |image|
    File.open("something.jpg","wb") do |file|
    file.puts image.read
    end
    }
    return "something.jpg"
  end
  
  def request
    @API_KEY = ENV['GOOGLE_API_KEY']
    @API_URL = "https://vision.googleapis.com/v1/images:annotate?key=#{@API_KEY}"
    # http_client = HTTPClient.new
    base64_image = Base64.strict_encode64(File.new(get_image, 'rb').read)
   
    body = {
      requests: [{
        image: {
          content: base64_image
        },
        features: [
          {
            type: 'TEXT_DETECTION',
            maxResults: 1
          }
        ]
      }]
    }.to_json
    
    # Google Cloud Vision APIにリクエスト投げる
    uri = URI.parse(@API_URL)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request["Content-Type"] = "application/json"
    response = https.request(request, body)
    
    response_rb = JSON.parse(response.body)
    @description = response_rb["responses"][0]["textAnnotations"][0]["description"]
    
  end
end