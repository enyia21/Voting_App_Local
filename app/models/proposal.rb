class Proposal < ActiveRecord::Base
    has_many :ballot_proposals
    has_many :ballots, through: :ballot_proposals
    has_many :voters, through: :ballots
end