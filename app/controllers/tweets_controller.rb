class TweetsController < ApplicationController

  def index
  end

  def create
    search_term = params['q'].capitalize
    @tweets = Tweets.new(search_term)
    response = RestClient.get "https://api.twitter.com/1.1/search/tweets.json?q={search_term}&result_type=popular"
    json = JSON.parse response
    if !json.nil?
      # @object1link = json["objects"][0]["images"][0]["b"]["url"]
      # @object1title = json["objects"][0]["title"]
      redirect_to @objects = json["statuses"]
    else
         render :index
    end
  end


  def show
  end

  private
  def
end
