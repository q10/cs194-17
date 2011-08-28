# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # protect_from_forgery # See ActionController::RequestForgeryProtection for details

  after_filter :update_victor

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def update_victor
    s = Settings.instance
    if s.voting_started and Candidate.victor
      s.victor_declared = true
      s.save!
    end
  end

  def update_vote_state
    s = Settings.instance
    if not s.voting_started
      s.voting_started = true
      s.save!
    end
  end

  def reset_state
    s = Settings.instance
    s.voting_started = false
    s.victor_declared = false
    s.save!
    Agent.delete_all
    Candidate.delete_all
  end
end
