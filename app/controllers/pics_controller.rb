class PicsController < ApplicationController
    
  def index
    @pics = Pic.last(2)
  end
  
  def new
    @pic = Pic.new
  end
  
  def create
    Pic.create(pic_params)
  end
  
  private
  def pic_params
    params.require(:pic).permit(:name, :image)
  end
  
  
  
  
  def textdetect
    require "open-uri"
    require 'base64'
    require 'json'
    require 'net/https'
    


    
      def img_get(url)
        open('sample.jpg', 'wb'){|saved_file|
          open(url, 'rb'){|read_file|
            saved_file.write(read_file.read)
          }
        }
      end
    
    
    url = @pic.image.to_s
    img_get(url)
    base64_image = Base64.strict_encode64(File.new("sample.jpg", 'rb').read)
    
    body = {
      requests: [{
        image: {
          content: base64_image
        },
        features: [
          {
            type: 'TEXT_DETECTION',
            maxResults: 5
          }
        ]
      }]
    }.to_json
    
    # Google Cloud Vision APIにリクエスト投げる
    uri = URI.parse( "h" )
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)
    request["Content-Type"] = "application/json"
    response = https.request(request, body)
    response.body
  end
  
end