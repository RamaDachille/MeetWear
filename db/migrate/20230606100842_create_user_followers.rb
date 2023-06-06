class CreateUserFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_followers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :follower, null: false, foreign_key: true
      t.references :followed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
