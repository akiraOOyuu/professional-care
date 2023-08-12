require 'rails_helper'

RSpec.describe UserCategory, type: :model do
  before do
    @user_category = FactoryBot.build(:user_category)
  end
  describe 'user_categoryの保存' do
    context 'user_categoryが保存できる場合' do
      
      it '就職日、所属園、ランクid、履修idがあれば保存できる' do
        expect(@user_category).to be_valid
      end
      it 'affiliationが全角文字だと保存できる' do
        @user_category.affiliation = '全角文字' # 正しいオブジェクトを使ってテストを実行
        expect(@user_category).to be_valid
      end
    end

    context 'user_categoryが保存できない場合' do       #異常系
      it 'ユーザーが紐付いていなければ保存できない' do
        @user_category.user = nil
        @user_category.valid?
         expect(@user_category.errors.full_messages).to include("ユーザーを入力してください")
    end
      it 'employmentが空では保存できない' do
        @user_category.employment = ''
        @user_category.valid?
        expect(@user_category.errors.full_messages).to include("就業日を入力してください") 
    end
      it 'affiliationが空では保存できない' do
         @user_category.affiliation = ''
         @user_category.valid?
         expect(@user_category.errors.full_messages).to include("所属園を入力してください","所属園は不正な値です") 
      end
      it 'rank_idを選択してないと保存できない' do
        @user_category.rank_id = " "
        @user_category.valid?
        expect(@user_category.errors.full_messages).to include("ランクを選択して下さい") 
      end
      it 'complate_idを選択してないと保存できない' do
        @user_category.complete_id = " "
        @user_category.valid?
        expect(@user_category.errors.full_messages).to include("履修を選択して下さい") 
      end     
    end
  end
end
