class Ballot < ActiveRecord::Base
    belongs_to :voter
    has_many :ballot_proposals
    has_many :proposals, through: :ballot_proposals
end