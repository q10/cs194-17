class Candidate < ActiveRecord::Base
  def self.exists?(name)
    Candidate.find_by_name(name) != nil
  end

  def counts
    Agent.all.find_all{|agent| agent.vote == name}.count
  end

  def self.victor
    n = Agent.all.count / 2
    return Candidate.all.find{|c| c.counts > n}
  end
end
