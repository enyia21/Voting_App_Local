class CreateBallotProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :ballot_proposals do |t|
      t.integer :ballot_id
      t.integer :proposal_id
    end
  end
end