module ApplicationHelper
  def calculate_total_time(lectures)
    total_time = 0
    lectures.each do |lecture|
      field_id = lecture.field_id
      lecture_time = lecture.lecture_time.to_i

      if [2, 3, 4, 5, 8].include?(field_id)
        total_time += lecture_time
      end
    end

    total_time
  end

  def min2hour(time)
    hour = time / 60
    min = time % 60

    "#{hour} 時間 #{min} 分"
  end
end
