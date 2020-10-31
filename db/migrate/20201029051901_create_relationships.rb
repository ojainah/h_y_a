class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      
      # 外部キーとしての設定
      t.references :user, foreign_key: true

      # 参照先のテーブルはusersテーブル
      t.references :follow, foreign_key: { to_table: :users }
      
      t.timestamps  

      # 重複してフォローできる事態を防ぐ
      t.index [:user_id, :follow_id], unique: true
    end
  end
end
