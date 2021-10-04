require 'rails_helper'

describe 'アイデア管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      idea_a = Factory.Bot.create(:idea, name: 'テスト',  body: 'テストコードを記載する’)
      # 作成者がアイデアを作成しておく
  end
end


  it '作成したいアイデアが表示される' do
    expect(page).to have_content 'テスト'
    # 作成済みのアイデアの名称が画面上に表示されていることを確認
  end


  describe '詳細表示機能' do
    it '作成したアイデアの詳細が表示される' do
      expect(page).to have_content 'テスト'
    end
  end

  describe '新規作成機能' do
    before do
      visit new_idea_path
      fill_in 'カテゴリー名称', with: idea_name
      fill_in '内容', with: idea_body
      click_button '登録する'
  end

  context '新規登録画面で名称を入力したとき' do
    let(:idea_name) {'新規作成のテストを書く'}

    it'正常に登録される' do
      expect(page).to have_selector '.alert-success', text: '新規作成のテストを書く'
    end
  end

  context '新規作成画面で名称を入力したとき' do
    let(:idea_name) { '' }

    it 'エラーとなる'　do
      within '#error_explanation' do
        expect(page).to have_content '名称を入力してください'
      end
    end
  end
end
