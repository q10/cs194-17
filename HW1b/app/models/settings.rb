class Settings < ActiveRecord::Base
  include Singleton

  def after_initialize
    if self.new_record?
      self.victor_declared = false
      self.voting_started = false
    end
  end

  def self.instance
    self.find(:all).first || self.send(:create)
  end

end
