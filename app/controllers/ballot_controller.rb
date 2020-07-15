class BallotController < ApplicationController

  get '/ballots' do
    @ballots = Ballot.all
    erb :'/ballots/index'
  end

  #------------------------------Results Ballots-------------------------------
  get '/ballots/results' do
    if !session[:voter_id]
      redirect "/voters/login"
    end

    @voter = Voter.find(session[:voter_id])
    @voters = Voter.find_by_location(@voter)
    @proposal_total = {}
    @approval_total = {}
    @percent_approval = {}
    @voters.each do |voter|    
      voter.ballot.proposals.each do |proposal|
            
        if !@proposal_total[proposal.name] 
            @proposal_total[proposal.name] = 0
        end
        if !@approval_total[proposal.name]
          @approval_total[proposal.name] = 0
        end
        @proposal_total[proposal.name] += 1
        if proposal.approve?
          @approval_total[proposal.name] += 1
        end
        @percent_approval[proposal.name] = ((@approval_total[proposal.name].to_f / @proposal_total[proposal.name].to_f) * 100).round(2)
      end
    end
    erb :'/ballots/results'

  end
  #------------------------------------------------------------------------

  #-----------------------------Create Ballots------------------------------0
  get '/ballots/new' do

    if !session[:voter_id]
      redirect "/voters/login"
    end
    #check whether voter has had a ballot created for him/her/them
    @voter = Voter.find(session[:voter_id])
    if !@voter.ballot
        @voter.ballot = Ballot.new(city: @voter.city, state: @voter.state)
    end

    if @voter.ballot.proposals.empty?
      redirect "/proposals/new"
    end
    # add proposals to ballot
    
    @voters_in_common_location = Voter.find_by_location(@voter)
    @voters_in_common_location.each do |current_voter|
      unique = Proposal.unique_proposals(current_voter.ballot.proposals, @voter.ballot.proposals)
      
      if !unique.empty?
        @voter.ballot.proposals << Proposal.duplicate_proposals(unique)
      end
    end
    #check if user is logged in
    erb :'/ballots/new'
  end

  post "/ballots/" do
    @voter = Voter.find(session[:voter_id])
    @voter.ballot.proposals.each do|proposal|
        
        proposal.update(approve?: params[:proposal_name][proposal.name])
    end
    @ballot = @voter.ballot
    redirect "/ballots/#{@ballot.id}"
  end

  #----------------------------------Show Route------------------------------------
  get "/ballots/:id" do
    if !session[:voter_id]
      redirect "/voters/login"
    end
    @voter = Voter.find(session[:voter_id])
    erb :"/ballots/show"
  end
  #-------------------------------------------------------------------------------

  #----------------------------------Edit Route------------------------------------
  get "/ballots/:id/edit" do
    if !session[:voter_id]
      redirect "/voters/login"
    end
    @voter = Voter.find(session[:voter_id])

    if @voter.ballot.proposals.empty?
      redirect "/proposals/new"
    end

    if !(@voter.ballot.id == params[:id].to_i)
      redirect '/voters/account'
    end
    erb :"/ballots/edit"
  end

  patch "/ballots/:id/edit" do
    @voter = Voter.find(session[:voter_id])
    @voter.ballot.proposals.each do|proposal|
      proposal.update(approve?: params[:proposal_name][proposal.name])
    end
    @ballot = @voter.ballot
    redirect "/ballots/#{@ballot.id}"
  end
  #--------------------------------------------------------------------------------
end