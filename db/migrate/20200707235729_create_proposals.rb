class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :name
      t.string :details
      t.boolean :approve?
    end
  end
end