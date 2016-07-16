class CreateCategories < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.integer :question_id
  		t.integer :tag_id

  		t.timestamps(null: false)
  	end
  end
end
