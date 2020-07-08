class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "voting_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    
end