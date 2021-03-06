class VoterController < ApplicationController


    #-----------------------------------Index Voters--------------------------------
    get '/voters/' do
        if !logged_in?
            redirect "/voters/login"
        end

        @voters = Voter.all
        erb :"/voters/index"
    end
    
    #-------------------------------------------------------------------------------
    # ------------------------------------  New Voters -----------------------------
    get '/voters/new' do
        erb :'voters/signup'
    end
    

    post '/voters/' do
        if Voter.all.count > 0 
           # verify drivers_license is unique
           if Voter.all.find{|voter| voter.drivers_license == params["drivers_license"]}
                session[:error_msg] = "Your drivers license numbers is taken!"
                redirect '/voters/failure'
           end

           # verify user_name is unique

           if Voter.find_by(user_name: params["user_name"])
                session[:error_msg] = "The username you requested is taken"
                redirect '/voters/failure'
           end
        end

        #check whether all fields were input correctly
        @new_voter = Voter.new(params)
        if !@new_voter.is_valid?
            session[:error_msg] = "Your signup is incomplete"
            redirect '/voters/failure'
        end

        #create voter and return to login page
        @new_voter.save
        redirect '/voters/login'
    end
    #--------------------------------------------------------------------------

    get '/voters/failure' do
        @error_msg = session[:error_msg]
        # binding.pry
        session[:error_msg] = nil
        erb :'/voters/failure'
    end

    get '/voters/login' do 
        erb :'/voters/login'
    end

    post '/voters/login' do
        @voter =Voter.find_by(user_name: params[:user_name])
        
        if !!@voter && !!@voter.authenticate(params[:password])

            session[:voter_id]=@voter.id
            redirect '/voters/account'
        else
            session[:error_msg] = "Please input a valid username and password!"
            redirect '/voters/failure'
        end
    end

    get '/voters/account' do
        @voter = current_voter
        erb :'/voters/account'
    end

    get '/voters/logout' do
        session.clear
        redirect '/voters/login'
    end

    #---------------------------------------Edit Voters-----------------------------------------------
    get '/voters/:id/edit' do
        #check if voter_id is present in session
        if !logged_in?
            session[:error_msg] = "Please login to edit your information! "
            redirect '/voters/failure'
        end
        # check if user is attempting to access their own voting information
        if params[:id] != session[:voter_id].to_s
            session[:error_msg] = "Error with input.  Please try again!"
            redirect '/voters/failure'
        end

        @voter = Voter.find(params[:id])
        erb :'/voters/edit'
    end
    
    patch '/voters/:id' do
        @voter = Voter.find(params[:id])
        @voter.update(params[:voter])
        @voter.save
        redirect "/voters/#{@voter.id}"
    end
    #----------------------------------------------------------------------------------

    #---------------------Show Route---------------------------------------------------
    get '/voters/:id' do
        if !logged_in?
            redirect "/voters/login"
        end
        @voter = Voter.find(params[:id])
        erb :'/voters/show'
    end
    #-----------------------------------------------------------------------------------


    # --------------------------Delete Voter----------------------------------------------
    delete '/voters/:id' do
        @voter = Voter.find(params[:id])
        @voter.destroy
        redirect '/voters/login' 
    end
    # -------------------------------------------------------------------------------------


    get '/voters/:id/ballot/new' do
        redirect '/ballots/new'
    end

    get '/voters/:id/proposal/new' do
        redirect '/proposals/new'
    end


end