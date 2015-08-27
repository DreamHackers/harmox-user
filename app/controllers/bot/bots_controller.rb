require 'oauth'

class Bot::BotsController < ApplicationController
  include BotConcern
  before_action :authenticate_user!

  def show
  end

  def new
    set_twitter_info

    render 'new'
  end

  def index
    if params[:username] == "new"
      self.new
    end
  end

  def create
    bot = set_twitter_info
    render action: 'admin/bot/new', alert: "登録失敗!!" if bot.nil?

    if bot.save
      delete_authinfo_to_session
      redirect_to(edit_bot_path(current_user.username, bot.id))
    else
      bot_new
      render 'admin/bot/new'
    end
  end

  def edit
  end

  def destroy
    bot = find_destroy_bot
    if bot.save
      flash[:delete] =  "論理削除完了!!"
      redirect_to admin_bot_index_path
    else
      render 'admin/bot/index'
    end
  end

  def callback
    auth = request.env["omniauth.auth"]

    save_authinfo_to_session(auth)

    redirect_to admin_bot_index_path
  end

  private
    def set_twitter_info
      bot = session[:bot]

      unless bot.nil?
        unless Bot.find_by_twitter_id(bot["twitter_id"]).nil?
          return nil
        end

        @bot = Bot.new
        @bot.user_id = bot["user_id"]
        @bot.access_token = bot["access_token"]
        @bot.access_secret = bot["access_secret"]
        @bot.twitter_id = bot["twitter_id"]
        @bot.twitter_name = bot["twitter_name"]
      end

      @bot
    end

    def find_destroy_bot
      Bot.find_by_id(params[:id]).tap do |bot|
        bot.twitter_id = bot.twitter_id.blank? ? Controllers::Bot::NG : bot.twitter_id
        bot.twitter_name = bot.twitter_name.blank? ? Controllers::Bot::NG : bot.twitter_name
        bot.access_token = bot.access_token.blank? ? Controllers::Bot::NG : bot.access_token
        bot.hash_tags = bot.hash_tags.blank? ? Controllers::Bot::NG : bot.hash_tags
        bot.deleted = true
      end
    end

    def save_authinfo_to_session(auth)
      token = auth[:credentials]

      session[:access_token] = token[:token]
      session[:access_secret] = token[:secret]

      info = auth[:info]

      session[:twitter_id] = info[:nickname]
      session[:twitter_name] = info[:name]
    end
end
