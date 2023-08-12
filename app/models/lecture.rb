class Lecture < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :lecture_day
    validates :lecture_time, format: { with: /\A[0-9]+\z/}
    validates :lecture_name
    validates :instructor_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  end

  validates :field_id, numericality: { message: "を選択してください" }

  scope :latest_lecture_date, -> { order(lecture_day: :desc).pluck(:lecture_day).first }
  
 
end
