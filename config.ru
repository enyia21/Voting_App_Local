require './config/environment'

begin 
    # check_migration

    use Rack::MethodOverride
    use BallotController
    use ProposalController
    use VoterController
    run ApplicationController

# rescue ActiveRecord::PendingMigrationError => err
#     STDERR.puts err
#     exit 1
end