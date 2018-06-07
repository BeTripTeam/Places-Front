class RoutesController < ApplicationController

    def index
        if cookies[:secret] != 'addjsda23113*&d12312123__1212821*^^77&&SAas1'
            redirect_to '/enter'
        else
            if not cookies[:token]
                redirect_to '/login'
            end
        end
    end

    def best
        url = URI.parse('http://localhost:3000/routes/best')

        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
        }
        render json:  res.body
    end

    def create
        url = URI.parse('http://localhost:3000/routes/admin/best')
   
        req = Net::HTTP::Post.new(url, 'Content-Type' => 'application/json')
        req['Authorization'] = cookies[:token]
        req.body = params.to_json
        res = Net::HTTP.start(url.hostname, url.port) do |http|
            http.request(req)
        end

        render json: res.body, status: res.code
    end

    def update
        url = URI.parse("http://localhost:3000/routes/admin/best/#{params[:id]}")

        req = Net::HTTP::Put.new(url, 'Content-Type' => 'application/json')
        req['Authorization'] = cookies[:token]
        req.body = params.to_json
        res = Net::HTTP.start(url.hostname, url.port) do |http|
            http.request(req)
        end

        render json: res.body, status: res.code
    end

    def destroy
        url = URI.parse("http://localhost:3000/routes/admin/best/#{params[:id]}")

        req = Net::HTTP::Delete.new(url, 'Content-Type' => 'application/json')
        req['Authorization'] = cookies[:token]
        res = Net::HTTP.start(url.hostname, url.port) do |http|
            http.request(req)
        end

        render json: res.body, status: res.code
    end

    def search
        url = URI.parse('http://localhost:3000/places/venues')

        param = {lat: params[:lat], lng: params[:lng]}
        url.query = URI.encode_www_form(param)

        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
        }
        render json:  res.body

        #render json: [{lat: 55.77666, lng: 49.16339}, {lat: 55.74666, lng: 49.16139}]
    end
end
