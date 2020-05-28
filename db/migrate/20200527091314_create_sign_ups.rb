class CreateSignUps < ActiveRecord::Migration[6.0]
  def change
    create_table :sign_ups do |t|
      t.references :User, null: false, foreign_key: true
      t.references :Event, null: false, foreign_key: true

      t.timestamps
    end
  end
end