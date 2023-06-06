class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :post_type
      t.text :description
      t.string :category
      t.string :occasion
      t.string :brand_tag
      t.boolean :size_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
