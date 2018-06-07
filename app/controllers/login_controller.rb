class LoginController < ApplicationController
    def index
        puts 'bbbbbbbb', cookies[:secret]
        if cookies[:secret] != 'addjsda23113*&d12312123__1212821*^^77&&SAas1'
            redirect_to '/enter'
        end
    end

    def login
        url = URI.parse('http://localhost:3000/auth')

        req = Net::HTTP::Post.new(url, 'Content-Type' => 'application/json')
        req.body = {email: params[:email], password: params[:password]}.to_json
        res = Net::HTTP.start(url.hostname, url.port) do |http|
            http.request(req)
        end
        if res.code == '200'
            token = JSON.parse(res.body)['token']
            cookies[:token] = {value: token, expires: 1.month.from_now}
            redirect_to '/places'
        else
            redirect_to '/login'
        end
    end
end
