class BallotProposal < ActiveRecord::Base
    belongs_to :ballot
    belongs_to :proposal
end