class Agent < ActiveRecord::Base
  def self.exists?(name)
    Agent.find_by_name(name) != nil
  end

  def voted_already?
    vote != nil
  end
end
