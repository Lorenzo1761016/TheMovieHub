class TweetsController < ApplicationController
    require 'twitter'   

    def create
        client = @search_twitter = Twitter::REST::Client.new do |config|
            config.consumer_key        = 'FR4EQwpC8DxZps2olJQXHzujv'
            config.consumer_secret     = 'rV4RURzJBFyCc6Uim0gs20CGHLBkGen1VD10qDKUfwt6wgWTyV'
            config.access_token        = "1014146447665659904-kBw19rr4EdWNyzhR9MjjCFwgjhaeQ3"
            config.access_token_secret = "CyyqnVhwsdTcpzEruvMhmD5lE9fJBBTsgGjS1KGXuA903"
          end
          '%#{params[:tweet]}%'
          @tweets = client.search(params[:obj_name], tweet_mode: "extended").take(20)
          ahoy.track "Tweets", language: "Ruby"
          rescue Twitter::Error::TooManyRequests => error
              # NOTE: Your process could go to sleep for up to 15 minutes but if you
              # retry any sooner, it will almost certainly fail with the same exception.
              sleep error.rate_limit.reset_in + 1
          retry
    end
    
    def index
        redirect_back fallback_location: root_path
    end
end