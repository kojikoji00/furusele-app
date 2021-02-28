require 'rails_helper'

RSpec.describe HistoryDetail, type: :model do
  let!(:user) {create(:user)}
  context 'ユーザーのHistoryが作成できている場合' do
    let!(:history) do
      user.histories.build({
      })
    end
    let!(:history_detail) { build(:history_detail, history: history)}
    it '商品一覧を作成できる' do
      puts history_detail.link
      puts history_detail.name
      puts history_detail.city
      puts history_detail.price
      puts history_detail.description
      puts history_detail.picture_image_path
      puts history_detail.review_image_path
      history_detail.save
      expect(history_detail).to be_valid
    end
  end
end
