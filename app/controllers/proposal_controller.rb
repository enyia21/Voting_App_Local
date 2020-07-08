class ProposalController < ApplicationController

    # do i need the :username designation /proposals/new may be good enough while
    # following restful routing protocols more closely
    get '/proposals/new' do
        binding.pry
        if !session[:voter_id]
            @error_msg = "Please login to make a proposal"
            redirect '/voters/login'
        end
        erb :"/proposals/create"
    end

    post '/proposals/' do
        #check if proposals are present
        binding.pry
        if params["proposal"]["name"].empty? || params["proposal"]["details"].empty?
            redirect '/proposals/new'
            binding.pry
        end

        if !Proposal.find_by(name: params["proposal"]["name"])
            @new_proposal = Proposal.new(params["proposal"])
            binding.pry
            @new_proposal.save

            redirect "/proposals/#{@new_proposal.id}"
        end
        # binding.pry
        # if 
    end


end