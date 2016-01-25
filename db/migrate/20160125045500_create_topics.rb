class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :public
      t.text :description

      t.timestamps null: false
    end
  end
end
