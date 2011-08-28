class MainController < ApplicationController
  def index
  end

  def victor
    v = Candidate.victor
    @victor = v ? v.name : "UNKNOWN"
  end

  def member
    if !Settings.instance.voting_started and params[:agent] and !params[:agent].empty? and !Agent.exists?(params[:agent])
      Agent.create!(:name => params[:agent])
    end
    render :action => 'index'
  end

  def vote
    agent, candidate = Agent.find_by_name(params[:agent]), params[:vote]
    if !Settings.instance.victor_declared and agent and candidate and !candidate.empty? and !agent.voted_already?
      if !Candidate.exists?(candidate)
        Candidate.create!(:name => candidate)
      end
      agent.update_attribute(:vote, candidate)
      update_vote_state
    end
    render :action => 'index'
  end

  def rst
    reset_state
    render :action => 'index'
  end

  def method_missing(name, *args, &block)
    render :action => 'index'
  end
end