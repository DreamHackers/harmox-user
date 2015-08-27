class Bot::BotOmniauthCallbacksController < ApplicationController
  require 'oauth'
  include BotConcern

  def oauth_consumer
    return OAuth::Consumer.new(Settings.twitter.consumer_key, Settings.twitter.consumer_secret, site: 'https://api.twitter.com')
  end

  def authorize
    request_token = oauth_consumer.get_request_token(:oauth_callback => Settings.twitter.callback_url)
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret

    redirect_to request_token.authorize_url
  end

  def callback
    request_token = OAuth::RequestToken.new(oauth_consumer, session[:request_token], session[:request_token_secret])

    # OAuthで渡されたtoken, verifierを使って、tokenとtoken_secretを取得
    access_token = nil
    begin
      access_token = request_token.get_access_token(
        {},
        :oauth_token => params[:oauth_token],
        :oauth_verifier => params[:oauth_verifier])
    rescue OAuth::Unauthorized => @exception
      # エラー処理
      raise
    end

    bot = Bot.new
    bot.user_id = current_user.id
    bot.access_token = access_token.token
    bot.access_secret = access_token.secret
    bot.twitter_id = access_token.params[:user_id]
    bot.twitter_name = access_token.params[:screen_name]

    session[:bot] = bot

    unless Bot.find_by_twitter_id(bot["twitter_id"]).nil?
      redirect_to(new_bot_path, alert: "すでに登録済みです")
    else
      redirect_to new_bot_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
