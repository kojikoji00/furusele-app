require 'rails_helper'

RSpec.describe HistoryDetail, type: :model do
  let!(:user) {create(:user)}
  context 'ユーザーのHistoryが作成できている場合' do
    let!(:history) do
      user.histories.build({
      })
    end
    let!(:history_detail) do
      history.history_detail.build({
        link: Faker::Lorem.characters(number: 20),
        name: Faker::Lorem.characters(number: 10),
        city: Faker::Lorem.characters(number: 6),
        price: Faker::Lorem.characters(number: 6),
        description: Faker::Lorem.characters(number: 40),
        picture_image_path: Faker::Lorem.characters(number: 20),
        review_image_path: Faker::Lorem.characters(number: 20)
      })
    end
    it '商品一覧を作成できる' do
      expect(history_detail).to be_valid
    end
  end
end
