class ProposalController < ApplicationController

    # do i need the :username designation /proposals/new may be good enough while
    # following restful routing protocols more closely

    #--------------------------------Index----------------------------------------
    get '/proposals/' do
        erb :'/proposals/index'
    end
    #-----------------------------------------------------------------------------

    
    #---------------------------New Action--------------------------------------
    get '/proposals/new' do
        binding.pry
        if !session[:voter_id]
            # @error_msg = "Please login to make a proposal"
            redirect '/voters/login'
        end
        erb :"/proposals/create"
    end

    post '/proposals/' do
        #check if ballot exists 
        binding.pry
        @voter = Voter.find(session[:voter_id])
        if !@voter.ballot
            @voter.ballot = Ballot.new(city: @voter.city, state: @voter.state)
        end

        #check if forms are completed correctly        
        if params["proposal"]["name"].empty? || params["proposal"]["details"].empty?
            redirect '/proposals/new'
            binding.pry
        end

        # if proposal name is found show user the proposal
        if !!Proposal.find_by(name: params["proposal"]["name"])
            @proposal = Proposal.find_by(name: params["proposal"]["name"])
            redirect "/proposals/#{@proposal.id}/edit"
        end

        #if proposal name doesn't exist create a new proposal with name and details
        if !Proposal.find_by(name: params["proposal"]["name"])
            @new_proposal = Proposal.new(params["proposal"])
            @new_proposal.save
            @voter.ballot.proposals << @new_proposal
            binding.pry

            redirect "/proposals/#{@new_proposal.id}"
        end
    end

    #-----------------------------Show Route---------------------------------
    get '/proposals/:id' do
        binding.pry
        @proposal = Proposal.find(params[:id])
        erb :'/proposals/show'
    end
    #------------------------------------------------------------------------

    #-----------------------------Edit Route----------------------------------
    get '/proposals/:id/edit' do
        binding.pry
        #verify that logged in voter can edit proposal
        @voter = Voter.find(session[:voter_id])
        @proposal = Proposal.find(params[:id])

        #catches when pro verify that proposal name belongs to user
        if !@voter.ballot.proposals.find_by(name: @proposal.name)
            redirect "/proposals/new"
        end
        binding.pry
        erb :"/proposals/edit"
    end

    patch '/proposals/:id/edit' do
        @proposal = Proposal.find(params[:id])
        @proposal.update(params[:proposal])
        @proposal.save
        redirect "/proposals/#{@proposal.id}"
    end
    #-----------------------------------------------------------------------------


end