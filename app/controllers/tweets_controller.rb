class TweetsController < ApplicationController
  

  def index
    @posts = Tweet.order(created_at: :desc)
    @tweet_count = @posts.where(:user_id=>current_user.id).count
  end

  def create
    @tweet = User.find(current_user).tweets.new(tweet_permit)
    if @tweet.save
      redirect_to tweets_path
    else
      render "new"
    end
  end

  def new
    @tweet = User.find(current_user).tweets.new
  end

  def tweet_permit 
    params.require(:tweets).permit(:text)
  end

end
