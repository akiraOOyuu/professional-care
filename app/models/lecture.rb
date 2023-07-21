class Lecture < ApplicationRecord

  belongs_to :user

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :lecture_name
    validates :instructor_name
  end

  with_options presence: true do
    validates :lecture_day
    validates :lecture_time, format: { with: /\A[0-9]+\z/}
  end

  validates :field_id, numericality: { other_than: 1, message: "can't be blank" }
  
 
end
