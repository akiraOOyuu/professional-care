class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :users

    validates :facility, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
end
