class BallotController < ApplicationController

  #  get '/ballot/'

  get '/ballots/' do
    erb :'/ballots/index'
  end
  
  get '/ballots/new' do
    binding.pry
    #check whether voter has had a ballot created for him/her/them
    @voter = Voter.find(session[:voter_id])
    if !@voter.ballot
        @voter.ballot = Ballot.new(city: @voter.city, state: @voter.state)
    end

    #add proposals to ballot
    @voter.ballot.proposals << Proposal.all - @voter.ballot.proposals

    #check if user is logged in
    erb :'/ballots/new'
  end


end