class TweetsController < ApplicationController
  

  def index
    @posts = Tweet.order(created_at: :desc)
    @tweet_count = current_user.tweets.count
  end

  def create
    @tweet = User.find(current_user).tweets.new(create_tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render "new"
    end
  end

  def new
    @tweet = User.find(current_user).tweets.new
  end

  def create_tweet_params 
    params.require(:tweets).permit(:text)
  end

end
