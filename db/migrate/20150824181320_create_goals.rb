class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body
      t.string :status
      t.boolean :completed
      t.references :user_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
