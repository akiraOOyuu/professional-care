class UserCategory < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :employment
    validates :affiliation,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  end

  validates :rank_id, numericality: { other_than: 1 , message: "を選択して下さい"}
  validates :complete_id, numericality: { other_than: 1 , message: "を選択して下さい"}
  
 
end
