class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true

  has_many :memberships, dependent: :destroy
  has_many :picks, dependent: :destroy
  has_many :leagues, through: :memberships
end
