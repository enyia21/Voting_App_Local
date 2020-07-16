class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "voting_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    
    helpers do
        def current_voter
            @current_voter ||= Voter.find_by(id: session[:voter_id])   
        end

        def logged_in?
            !!current_voter
        end
    end

    get '/' do
        erb :'index'
    end
end