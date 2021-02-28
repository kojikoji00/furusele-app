require 'rails_helper'

RSpec.describe History, type: :model do
  let!(:user) {create(:user)}
  context 'ユーザーの登録ができている場合' do
    let!(:history) do
      user.histories.build({
      })
    end
    it 'Historyを作成できる' do
      expect(history).to be_valid
    end
  end

end
