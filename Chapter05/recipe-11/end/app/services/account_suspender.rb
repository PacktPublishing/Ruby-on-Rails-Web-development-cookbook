class AccountSuspender
  def initialize(user, clock: -> { Time.zone.now })
    @user  = user
    @clock = clock
  end

  def call(reason:, suspend:)
    return :skipped unless suspend
    @user.suspend!(at: @clock.call, reason: reason)
    :suspended
  end
end

