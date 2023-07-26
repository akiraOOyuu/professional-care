require 'rails_helper'

RSpec.describe UserCategory, type: :model do
  before do
    @lecture = FactoryBot.build(:lecture) 
  end

  describe 'user_categoryの保存' do
    context 'user_categoryが保存できる場合' do
      
      it '就職日、所属園、ランクid、履修idがあれば保存できる' do
        expect(@user_category).to be_valid
      end
      it 'affiliationが全角文字だと保存できる' do
        @lecture.user_category
      end
    end

    context 'user_categoryが保存できない場合' do       #異常系
      it 'ユーザーが紐付いていなければ保存できない' do
        @user_category.user = nil
        @user_category.valid?
         expect(@lecture.errors.full_messages).to include('User must exist')
    end
      it 'employmentが空では保存できない' do
        @lecture.employment = ''
        @lecture.valid?
        expect(@lecture.errors.full_messages).to include("Employment time can't be blank") 
    end
      it '就業日が空では保存できない' do
         @user_category.affiliation = ''
         @user_category.valid?
         expect(@user_category.errors.full_messages).to include("Affiliation day can't be blank") 
      end
      it 'rank_idが初期値では保存できない' do
        @user_category.rank_id = 1
        @user_category.valid?
        expect(@user_category.errors.full_messages).to include("Rank can't be blank") 
      end
      it 'complate_idが初期値では保存できない' do
        @user_category.complate_id = 1
        @user_category.valid?
        expect(@user_category.errors.full_messages).to include("Complate can't be blank") 
      end     
    end
  end
end
