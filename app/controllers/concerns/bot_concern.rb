module BotConcern

  # Twitter sessionを削除する.
  def delete_authinfo_to_session
    session.delete(:bot)
  end
end
