require "twitter"


class MicroBlogger
  attr_reader :client
  def initialize
    p "initializing MicroBlogger"
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "QhTt2Gv6kWmDys"
      config.consumer_secret     = "L70GHDYlWfDQn30Jb4oqh9NT14XyMVMhU5F21px"
      config.access_token        = "79844066068051wAFNukgm3Q8zrz5Ds1MPqVv4Jie1E"
      config.access_token_secret = "ID049RTVg5ZEEig7f7ycPbh2uqqK0et5eSZMMpo"
    end
  end

  def run
    command = ""
    while command != "q"
      p "Welcome to twitter, what do you want to do?"
      p " - Type 't <tweet message>' to tweet"
      p " - Type 'dm <user> <message>' to send a direct message"
      p " - Type 'spam <message>' to dm all your followers"
      p " - Type 'f' to read the latest tweet of all the people you follow"
      p " - Press 'q' to quit"
      command = gets.chomp
      command = command.split(" ")
      case command[0]
      when "q" then p "Goodbye Simon!"; exit
      when 't' then tweet(command[1..-1].join(" ")
      when 'dm' then dm(command[1], command[2..-1].join(" "))
      when 'spam' then spam_my_followers(command[1..-1].join(" "))
      when 'f' then show_last_feed
      else
        p "That's not a valid command :("
      end
    end
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      message = message.ljust(140)
      @client.update(message)
    end
    p "Succesfully tweeted '#{message}'"
  end

  def dm(target, message)
    screen_names = followers_list
    puts "Trying to send #{target} this direct message: '#{message}'"
    if screen_names.include? target
      mail = "d @#{target} #{message}"
      tweet(mail)
      p "Succesfully send '#{message}' to '@#{target}'"
    else
      p "This person isn't following you and therefore can't be DM'ed"
    end
  end

  def spam_my_followers(message)
    followers_list.each do |follower|
      dm(follower, message)
    end
  end

  def followers_list
    @client.followers.collect { |follower| @client.user(follower).screen_name }
  end

  def show_last_feed
    friends =  @client.friends.collect  { |friend| @client.user(friend) }
    friends.each do |friend|
      p "#{friend.screen_name} tweeted: '#{friend.status.text}' on #{friend.status.created_at}"
    end
  end

end

blogger = MicroBlogger.new
blogger.run
