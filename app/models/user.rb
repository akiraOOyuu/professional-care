class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
           with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
             validates :first_name
             validates :last_name
           end
           with_options presence: true, format: { with: /\A[あ-んー]+\z/ } do
             validates :first_name_reading
             validates :last_name_reading
           end
           with_options presence: true do
            validates :postcode        ,format: { with: /\A\d{3}[-]\d{4}\z/, message: "is not a valid format" }
            validates :city 
            validates :block
            validates :prefecture_id    , numericality: {other_than: 1, message: "can't be blank"}
           end
         validates :birth_date, presence:true

         validates :worker_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
         validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

         has_one :user_category
end
