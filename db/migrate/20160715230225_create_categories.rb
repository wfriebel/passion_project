class CreateCategories < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.integer :question_id
  		t.integer :content_tag_id

  		t.timestamps(null: false)
  	end
  end
end
