require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '内容に問題ない場合' do

    it 'email、passwordとpassword_confirmation,worker_prefecture_id,childcare_worker_number,first_name,last_name,first_name_reading,last_name_reading,birth_date, postcode,prefecture_id,city,block,buildingが存在すれば登録できる' do
      @user = FactoryBot.build(:user)
    end
    it 'passwordが英数字混合だと登録できる' do
      @user.password
    end
    it 'first_name,last_name,first_name_reading,last_name_readingが全角だと登録できる' do
      @user.first_name
      @user.last_name
      @user.first_name_reading
      @user.last_name_reading
    end
    it 'childcare_worker_numberが半角数字だと登録できる' do
      @user.childcare_worker_number
    end
    it 'buildingは空でも保存できること' do
      @user.building = ""
      expect(@user).to be_valid
    end
  end


  context '内容に問題ある場合' do
    
    it 'emailが空では登録できない' do
      @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'worker_prefecture_idを選択していないと保存できないこと' do
      @user.prefecture_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'childcare_worker_numberが空では登録できない' do
      @user.childcare_worker_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Childcare worker number can't be blank")
    end
    it 'childcare_worker_numberが12桁以上では登録できない' do
      @user.childcare_worker_number = '1223456879101112'
        @user.valid?
        expect(@user.errors.full_messages).to include("Childcare worker number is invalid")
    end
    it 'childcare_worker_numberが全角数字では登録できない' do
      @user.childcare_worker_number = '６４５６５４'
        @user.valid?
        expect(@user.errors.full_messages).to include("Childcare worker number is invalid")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it 'first_nameが半角文字が含まれていると登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include( "First name is invalid")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank","Last name is invalid")
    end
    it 'last_nameが半角文字が含まれていると登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_name_readingが空では登録できない' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include( "First name reading can't be blank","First name reading is invalid")
    end
    it 'first_name_readingが半角文字では登録できない' do
      @user.first_name_reading = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include( "First name reading is invalid")
    end
    it 'last_name_readingが空では登録できない' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank", "Last name reading is invalid")
    end
    it 'last_name_readingが半角文字では登録できない' do
      @user.last_name_reading = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Last name reading is invalid")
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'emailは空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英語のみでは登録できない' do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが半角数字のみでは登録できない' do
      @user.password = "12356"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが全角入力では登録できない' do
      @user.password = "あいうえおか"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it ' postcodeが空だと保存できないこと' do
      @user.postcode = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Postcode can't be blank")
    end

    it ' postcodeは-がないと保存できないこと' do
      @user.postcode = "1234567"
      @user.valid?
    expect(@user.errors.full_messages).to include("Postcode is not a valid format")
    end

    it ' postcodeは7文字でないと保存できないこと' do
      @user.postcode = "123-456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Postcode is not a valid format")
      end

    it 'prefecture_idが空だと保存できないこと' do
      @user.prefecture_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idを選択していないと保存できないこと' do
      @user.prefecture_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @user.city = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @user.block = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Block can't be blank")
    end
   
  end
end
