class RedisClient
  def self.current
    @redis_client ||= Redis.new(
      url: Settings.redis.url,
      password: Settings.redis.password
    )
  end
end
