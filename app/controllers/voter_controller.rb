class VoterController < ApplicationController
    
    get '/voters/signup' do
        erb :'voters/signup'
    end
    

    post '/voters/signup' do
        # ensure drivers_license is unique
        if Voter.all.count > 0 
           if Voter.all.find{|voter| voter.drivers_license == params["drivers_license"]}
                @error_msg = "Your drivers license numbers is taken!"
                redirect '/voters/failure'
           end

           # ensure user_name is unique
           binding.pry
           if Voter.find_by(user_name: params["user_name"])
                @error_msg = "The username you requested is taken"
                redirect '/voters/failure'
           end
        end

        #check whether all fields were input correctly
        @new_voter = Voter.new(params)
        if !@new_voter.is_valid?
            @error_msg = "Your signup is incomplete"
            redirect '/voters/failure'
        end

        #create voter and return to login page
        @new_voter.save
        redirect '/voters/login'
    end
    

    get '/voters/failure' do
        @error_msg = params["error_msg"]
        erb :'voters/failure'
    end

    get '/voters/login' do 
        erb :'voters/login'
    end

    post '/voters/login' do
        ##your code here
        binding.pry
        @voter =Voter.find_by(user_name: params[:user_name])
        
        if !!@voter && !!@voter.authenticate(params[:password])
            # binding.pry
            session[:voter_id]=@voter.id
            redirect '/voters/account'
        else
            @error_msg = "Please input a valid username and password!"
            redirect '/voters/failure'
        end
    end

    get '/voters/account' do
        @voter = Voter.find(session[:voter_id])
        erb :'/voters/account'
    end

    get '/voters/logout' do
        session.clear
        redirect '/voters/login'
    end

    #Edit Voters
    get '/voters/:id/edit' do
        #check if voter_id is present in session
        if !session[:voter_id]
            @error_msg = "Please login to edit your information! "
            redirect '/voters/failure'
        end
        # check if user is attempting to access their own voting information
        if params[:id] != session[:voter_id]
            @error_msg = "Error with input.  Please try again!"
            redirect '/voters/failure'
        end

        @voter = Voter.find(params[:id])
        erb :'/voters/edit'
    end
    
    
    get '/voters/:id/ballot/new' do
        binding.pry
        
        erb :'/ballots/new'
    end

    get '/voters/:id/proposal/new' do
        binding.pry

        erb :'/proposals/:id/new'
    end


end