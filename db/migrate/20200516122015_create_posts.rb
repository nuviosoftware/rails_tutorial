class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.datetime :posted_on
      t.references :profile, null: false, foreign_key: true
      t.timestamps
    end
  end
end
