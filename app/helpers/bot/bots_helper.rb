module Bot::BotsHelper
  def bots?
    bots
  end

  def bots
    @bots ||= Bot.find_by_alive
  end

  def get_twitter_name
    session[:twitter_name].nil? ? nil : session[:twitter_name]
  end

  def get_twitter_id
    session[:twitter_id].nil? ? nil : "@"+session[:twitter_id]
  end
end
