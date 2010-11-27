# -*- coding: utf-8 -*-
require File.join(File.dirname(File.expand_path(__FILE__)), 'spec_helper')

describe Zenra do

  context 'zenrize text' do
    context 'without application id' do
      it { lambda{ Zenra.new }.should raise_error RuntimeError }
      it { Object.private_methods.should be_include :z}
    end

    context 'with application id' do
      before :all do
        Zenra.app_id = APPLICATION_ID
        @zenra = Zenra.new
      end

      context 'and no extra option' do
        it { @zenra.zenrize('お腹が空きました'). should be_eql 'お腹が全裸で空きました' }
      end
      context 'and extra :pos and :add option' do
        it {
          @zenra.zenrize('お腹が空いたのでスパゲッティが食べたい', :pos => '名詞', :add => '夜の').
          should be_eql '夜のお腹が空いたので夜のスパゲッティが食べたい'
        }
      end
      context 'and extra :add option' do
        it {
          @zenra.zenrize('お腹が空いたのでスパゲッティが食べたい', :add => '半裸で').
          should be_eql 'お腹が半裸で空いたのでスパゲッティが半裸で食べたい'
        }
      end
      context 'and extra :pos option' do
        it {
          @zenra.zenrize('お腹が空いたのでスパゲッティが食べたい', :pos => '名詞').
          should be_eql '全裸でお腹が空いたので全裸でスパゲッティが食べたい'
        }
      end
      context 'called from top level' do
        it {
          z('焼肉を食べて酒を飲んだ。').
          should be_eql '焼肉を全裸で食べて酒を全裸で飲んだ。'
        }
      end
    end

  end
end
