class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :tittle
      t.integer :skill_percent

      t.timestamps
    end
  end
end
