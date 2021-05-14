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
