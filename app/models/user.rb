class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :user_category
  has_many :lectures

    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :first_name
      validates :last_name
    end
    with_options presence: true, format: { with: /\A[あ-んー]+\z/ } do
      validates :first_name_reading
      validates :last_name_reading
    end
    with_options presence: true do
    validates :childcare_worker_number ,format: { with: /\A\d{1,12}\z/ }
    validates :postcode                ,format: { with: /\A\d{3}[-]\d{4}\z/, message: "is not a valid format" }
    validates :city 
    validates :block
    validates :prefecture_id           , numericality: {other_than: 1, message: "can't be blank"}
    end
    validates :birth_date, presence:true

    validates :worker_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, presence: true, on: :create
     # パスワードのバリデーションを更新（編集）時に適用する
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, allow_blank: true, on: :update

      
    # :edit_other_infoに設定して、バリデーションを定義
    with_options on: :edit_other_info do |edit_user|
    # パスワードが空（nilまたは空文字列）であることを検証
      edit_user.validates :password, absence: true
    # パスワード確認が空（nilまたは空文字列）であることを検証
      edit_user.validates :password_confirmation, absence: true
    end

end
