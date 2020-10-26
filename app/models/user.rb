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
end
