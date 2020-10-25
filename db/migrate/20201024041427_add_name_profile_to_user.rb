class AddNameProfileToUser < ActiveRecord::Migration[6.0]

# deviseの初期状態でのカラムに「name」「profile」カラムがない為追加。
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
  end
end
