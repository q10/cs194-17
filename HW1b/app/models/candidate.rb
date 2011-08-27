class Candidate < ActiveRecord::Base
  def counts
    Agent.all.find_all{|agent| agent.vote == name}.count
  end

  def self.victor
    n = Agent.all.count / 2
    return Candidate.find{|c| c.counts > n}
  end
end
