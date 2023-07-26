class UserCategory < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :employment
    validates :affiliation,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  end

  validates :rank_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :complete_id, numericality: { other_than: 1 , message: "can't be blank"}
  
 
end

