class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body, null: false
      t.string :status, null: false
      t.boolean :completed, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
