class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true# 空欄は許しません
  validates :email, presence: true # 空欄は許しません

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:[:twitter]
end
  