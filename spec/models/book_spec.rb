require 'rails_helper'

describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '本投稿' do
    context '投稿成功' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@book).to be_valid
      end
    end

    context '投稿失敗' do
      it 'imageが空だと保存できない' do
        @book.image = nil
        @book.valid?
        expect(@book.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @book.name = nil
        @book.valid?
        expect(@book.errors.full_messages).to include("Name can't be blank")
      end

      it 'authorが空だと保存できない' do
        @book.author = nil
        @book.valid?
        expect(@book.errors.full_messages).to include("Author can't be blank")
      end

      it 'Categoryが選択されてないと保存できない' do
        @book.category_id = 1
        @book.valid?
        expect(@book.errors.full_messages).to include('Category Select')
      end
    end
  end  
end