require 'net/http'
class GitapisController < ApplicationController

    def index
        url = URI("https://api.github.com/repos/kbmodhia/git_repo_data/commits")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["authorization"] = 'token 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'
        request["content-type"] = 'application/json'
        response = http.request(request)
        @api_data = JSON.parse(response.read_body)
        puts @api_data     
    end


end
