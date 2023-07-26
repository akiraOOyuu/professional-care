require 'rails_helper'

RSpec.describe Lecture, type: :model do
  before do
    @lecture = FactoryBot.build(:lecture) 
  end

  describe '講義情報の保存' do
    context '講義情報が保存できる場合' do
      
      it '講義日、分野、講義時間、講義名、講師名があれば保存できる' do
        expect(@lecture).to be_valid
      end
      it 'lecture_timeが半角数字だと保存できる' do
        @lecture.lecture_time
      end
    end

    context '講義情報が保存できない場合' do       #異常系
      it 'ユーザーが紐付いていなければ保存できない' do
        @lecture.user = nil
        @lecture.valid?
         expect(@lecture.errors.full_messages).to include('User must exist')
    end
      it '日付が空では保存できない' do
         @lecture.lecture_day = ''
         @lecture.valid?
         expect(@lecture.errors.full_messages).to include("Lecture day can't be blank") 
      end
      it 'lecture_timeが空では保存できない' do
        @lecture.lecture_time = ''
        @lecture.valid?
        expect(@lecture.errors.full_messages).to include("Lecture time can't be blank") 
     end
     it 'lecture_timeが全角数字では保存できない' do
      @lecture.lecture_time = '９０'
      @lecture.valid?
      expect(@lecture.errors.full_messages).to include("Lecture time is invalid") 
   end
      it 'lecture_nameが空では保存できない' do
        @lecture.lecture_name = ''
        @lecture.valid?
        expect(@lecture.errors.full_messages).to include("Lecture name can't be blank") 
     end     
      it 'instructor_nameが空では保存できない' do
        @lecture.instructor_name = ''
        @lecture.valid?
        expect(@lecture.errors.full_messages).to include("Instructor name can't be blank") 
      end
      it 'instructor_nameが全角数字では保存できない' do
        @lecture.instructor_name = '１１１１'
        @lecture.valid?
        expect(@lecture.errors.full_messages).to include("Instructor name is invalid") 
      end
      it 'instructure_nameにスペースがあると保存できない' do
        @lecture.instructor_name = ' '
        @lecture.valid?
        expect(@lecture.errors.full_messages).to include("Instructor name is invalid") 
      end
      it 'fild_idが初期値では保存できない' do
        @lecture.field_id = 1
        @lecture.valid?
        expect(@lecture.errors.full_messages).to include("Field can't be blank") 
      end     
    end
  end
end

