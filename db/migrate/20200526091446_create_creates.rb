class CreateCreates < ActiveRecord::Migration[6.0]
  def change
    create_table :creates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
