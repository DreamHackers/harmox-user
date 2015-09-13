namespace :exec_schedule do
  desc "Scheduleモデルに登録されたBotのスケジュールに従ってRetweet、Followをする"
  task :execute => :environment do |task|
    span_start = "#{Time.zone.now.strftime("%H")}:00"
    span_end = "#{Time.zone.now.strftime("%H")}:59"
    Bot.find_by_alive.each do |bot|
      schedule_time = "#{bot.schedule.time.strftime("%H")}:#{bot.schedule.time.strftime("%M")}"

      if span_start <= schedule_time && schedule_time <= span_end
        follow_twitter_client(bot.id)
        retweet_twitter_client(bot.id)
      end
    end
  end

  def create_client(bot)
    client = Twitter::REST::Client.new(
      consumer_key:        Settings.twitter.consumer_key,
      consumer_secret:     Settings.twitter.consumer_secret,
      access_token:        bot.access_token,
      access_token_secret: bot.access_secret
    )
  end

  def follow_twitter_client(id)
    bot = Bot.find_by({id: id.to_i})

    client = create_client(bot)

    word = ""

    bot.hash_tags.each do |hash_tag|
      word = word + " #" + hash_tag.hash_tag + ""
    end

    client.search(word + " -BOT", result_type: "recent", lang: "ja", count: 1).take(1).each do |tweet|
      begin
        client.follow(tweet.user.id)
        break
      rescue
        next
      end
    end
  end

  def retweet_twitter_client(id)
    bot = Bot.find_by({id: id.to_i})

    client = create_client(bot)

    max_favorite_count = -1
    most_favorite_tweet = nil

    client.home_timeline(count: 100, exclude_replies: true, include_rts: true).each do |tweet|
      if(tweet.favorite_count > max_favorite_count)
        max_favorite_count = tweet.favorite_count
        most_favorite_tweet = tweet
      end
    end

    begin
      client.retweet(most_favorite_tweet)
    rescue
    end
  end
end
