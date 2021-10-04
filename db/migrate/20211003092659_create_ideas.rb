class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :name, null: false, unique: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
