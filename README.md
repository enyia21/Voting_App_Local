# Voting_App_Local

## Gemfile Creation
1.  Gemfile Installation
    A. Gemfiles to be installed will include:
        1. 'sinatra' 
        2. 'activerecord'
        3. 'sinatra-activerecord'
        4. 'rake' 
        5. 'require_all'
        6. 'pry'
        7. 'tux' 
            - Allows us to test if our activerecord connections are correct.
        8. 'thin'
        9. 'shotgun'
        10. 'sqlite3'
    B.  Gemfiles for testing includes
        1.  launchy
        2.  rack-test
    C.  Gemfiles and dependencies were installed 
## Build file Stucture

## View Structure   
    1. Ballots
        A. index.erb - Allow users to input a zipcode and pull up a proposal
        
        B. show.erb - Should allow a user to see the entire ballot listing all proposals, based on zipcode

        C. failure.erb - will list the zipcodes available to traverse or send users back to the home screen
    2.  Proposals
        A. index.erb - Prints zipcodes with proposals pending
        B. show.erb - shows a list of proposals by zipcode.  Allows of the deletion of a proposal 
        C. create.erb - Creates a proposal based on zipcode and 
        D. edit.erb 
    3.  Voters
        A. index.erb
        B. show.erb
        C. account.erb
        D. failure.erb
        E. login.erb
