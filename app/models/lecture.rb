class Lecture < ApplicationRecord

  belongs_to :user

  with_options presence: true,  do
   
    
  end

  with_options presence: true do
    validates :lecture_day
    validates :lecture_time, format: { with: /\A[0-9]+\z/}
    validates :lecture_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :instructor_name, format: { with: /\A[0-9０-９ぁ-んァ-ヶ一-龥・ 　ー()（）\s]+\z/ }
  end

  validates :field_id, numericality: { other_than: 1, message: "can't be blank" }
  
 
end
