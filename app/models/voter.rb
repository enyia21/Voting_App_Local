class Voter < ActiveRecord::Base
    has_one :ballot
    has_many :proposals, through: :ballots
    has_secure_password
end