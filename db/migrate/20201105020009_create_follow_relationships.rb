class CreateFollowRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_relationships do |t|
      t.references :follower, foreign_key: { to_table: :users }# （外部キー）を設定
      t.references :following, foreign_key: { to_table: :users }# （外部キー）を設定
      
      t.timestamps
    end
    add_index :follow_relationships, [:follower_id, :following_id], unique: true
  end
end
