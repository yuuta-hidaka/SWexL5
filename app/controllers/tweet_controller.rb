class TweetController < ApplicationController
    def index
        @tweet = Tweet.all
    end
    def new
        @tweet = Tweet.new
    end
    def create
        @tweet = Tweet.new(message: params[:tweet][:message])
        if @tweet.save
            flash[:notice] = '1レコード追加しました'
            redirect_to root_path
        else
            render new_tweet_path
        end
    end
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to root_path
    end
end