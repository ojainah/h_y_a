class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        #  :confirmable, 
         :lockable, :timeoutable, :trackable

  #  nameに空欄は許しませんよ！
  validates :username, presence: true
  # profileは２００文字に抑えてくさだいね！
  validates :profile, length: { maximum: 200 }

  # has_many…テーブル同士を関連付ける
  # 実は「has_many :relationships, foreign_key: 'user_id'」という意味。
  # (foregin_key = 入口)
  has_many :relationships

  # followings…架空のクラス(モデル)
  # through: :relationships …「中間テーブルはrelationships」という設定
  # source: :follow…「relationshipsテーブルのfollow_idを参考にして、followingsモデルにアクセスする」設定
  # (source = 出口)
  has_many :followings, through: :relationships, source: :follow

  # has_many :reverse_of_relationships…「has_many :relaitonshipsの”逆方向”」の意味
  # class_name: 'Relationship'…「relationsipモデルの事」という設定
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'

  # foreign_key: 'follow_id'…「relaitonshipsテーブルにアクセスする時、follow_idを入口として来てね！」
  # source: :user…「出口はuser_idね！それでuserテーブルから自分をフォローしているuserをとってきてね！」と設定
  has_many :followers, through: :reverse_of_relationships, source: :user



  # ＜フォロー機能のメソッド＞
  # 注意すべき点は、フォローが自分自身ではないか？＆すでにフォローしていないか？

  # unless self == other_user によって、フォローしようとしている other_user が自分自身ではないかを検証
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  # def unfollow…フォローがあればアンフォローする
  # relationship.destroy if relationship…relationship が存在すれば destroy する
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

# def following? …self.followings によりフォローしている User 達を取得
# include?(other_user) …other_user が含まれていないかを確認
  def following?(other_user)
    self.followings.include?(other_user)
  end

end
