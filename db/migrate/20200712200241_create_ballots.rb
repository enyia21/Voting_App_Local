class CreateBallots < ActiveRecord::Migration[5.2]
  def change
    create_table :ballots do |t|
      t.string :city
      t.string :state
      t.integer :voter_id
    end
  end
end
