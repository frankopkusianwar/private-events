class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :invitor_id
      t.integer :invitee_id
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
    add_index :invitations, :invitor_id
    add_index :invitations, :invitee_id
  end
end
