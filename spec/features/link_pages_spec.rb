require 'rails_helper'

describe 'Links' do

  subject { page }

  describe '#new' do
    let(:submit) { 'shrtn' }

    before { visit new_link_path }

    describe 'with empty url' do
      before do
        fill_in "url", with: ''
        click_button submit
      end

      it { should have_selector('div.alert.alert-danger', text: "Url can't be blank") }
    end

    describe 'with short url' do
      before do
        fill_in "url", with: 'a.g'
        click_button submit
      end

      it { should have_selector('div.alert.alert-danger', text: "Url is too short") }
    end
  end
end
