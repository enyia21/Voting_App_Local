class Proposal < ActiveRecord::Base
    has_many :ballot_proposals
    has_many :ballots, through: :ballot_proposals
    has_many :voters, through: :ballots

    def self.list_by_name(proposals)
        proposals.collect{|proposal| proposal.name}
    end

    def self.list_proposals(names_arr)
        names_arr.collect{|proposal_name|Proposal.find_by(name: proposal_name)}
    end


    def self.unique_proposals(input_voter_proposals, current_voter_proposals)
        input_names = self.list_by_name(input_voter_proposals)
        current_names = self.list_by_name(current_voter_proposals)
        unique_names = input_names.select{|propname| !current_names.include?(propname)}
        self.list_proposals(unique_names) 
    end

    def self.duplicate_proposals(proposals)
        binding.pry
        proposals.collect{|proposal| Proposal.create(name: proposal.name, details: proposal.details)}
    end
end