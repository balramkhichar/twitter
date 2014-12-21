class TweetsController < ApplicationController
  

  def index
    @posts = Tweet.all
    @tweet_count = @posts.where(:user_id=>current_user.id).count
  end

  def create
    allow_data = tweet_permit
    allow_data["user_id"]= current_user.id
    @tweet = Tweet.new(allow_data)
    if @tweet.save
      redirect_to tweets_path
    else
      render "new"
    end
  end

  def new
    @tweet = Tweet.new
  end

  def tweet_permit 
    params.require(:tweets).permit(:text)
  end

end
