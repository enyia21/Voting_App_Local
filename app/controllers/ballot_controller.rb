class BallotController < ApplicationController

  #  get '/ballot/'
  #------------------------------Index Ballots-------------------------------
  get '/ballots/' do
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
            binding.pry
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
            binding.pry
            @percent_approval[proposal.name] = ((@approval_total[proposal.name].to_f / @proposal_total[proposal.name].to_f) * 100).round(2)
      end
    end
    erb :'/ballots/index'

  end
  #------------------------------------------------------------------------

  #-----------------------------Create Ballots------------------------------0
  get '/ballots/new' do
    #check whether voter has had a ballot created for him/her/them
    @voter = Voter.find(session[:voter_id])
    if !@voter.ballot
        @voter.ballot = Ballot.new(city: @voter.city, state: @voter.state)
    end

    @voter.ballot.proposals
    # add proposals to ballot
    
    @voters_in_common_location = Voter.find_by_location(@voter)
    @voters_in_common_location.each do |current_voter|
      unique = Proposal.unique_proposals(current_voter.ballot.proposals, @voter.ballot.proposals)
      binding.pry
      if !unique.empty?
      @voter.ballot.proposals << Proposal.duplicate_proposals(unique)
      end
    end
    

    #check if user is logged in
    erb :'/ballots/new'
  end

  post "/ballots/" do
    #to build ballot you need to check if a ballot exists.  If ballot doesn't exist for user
    #create ballot and all all Propoposal from voters in the same city and state
    @voter = Voter.find(session[:voter_id])
    @voter.ballot.proposals.each do|proposal|
        binding.pry
        proposal.update(approve?: params[:proposal_name][proposal.name])
    end
    @ballot = @voter.ballot
    redirect "/ballots/#{@ballot.id}"
  end

  #----------------------------------Show Route------------------------------------
  get "/ballots/:id" do
    @voter = Voter.find(session[:voter_id])
    erb :"/ballots/show"
  end
  #-------------------------------------------------------------------------------

  #----------------------------------Edit Route------------------------------------
  get "/ballots/:id/edit" do
    binding.pry
    if !session[:voter_id]
      redirect "/voters/login"
    end
    @voter = Voter.find(session[:voter_id])
    if !(@voter.ballot.id == params[:id].to_i)
      redirect '/voters/account'
    end
    erb :"/ballots/edit"
  end

  patch "/ballots/:id/edit" do
    binding.pry
    @voter = Voter.find(session[:voter_id])
    @voter.ballot.proposals.each do|proposal|
      proposal.update(approve?: params[:proposal_name][proposal.name])
  end
  @ballot = @voter.ballot
  redirect "/ballots/#{@ballot.id}"
  end
  #--------------------------------------------------------------------------------
end