# -*- coding: utf-8 -*-
require File.join(File.dirname(File.expand_path(__FILE__)), 'spec_helper')

describe YahooApiDAService do
  context 'connect with application id' do
    before :all do
      @y = YahooApiDAService.new APPLICATION_ID, 'うちの庭には二羽鶏がいます。'
    end

    it 'should build REXML::Document from sample sentence' do
      xml_doc = @y.xml_document
      results = [
                 %w{ 名詞 地名町名 * うち うち うち },
                 %w{ 助詞 助詞連体化 * の の の },
                 %w{ 名詞 名詞場所 * 庭 にわ 庭 },
                 %w{ 助詞 格助詞 * に に に },
                 %w{ 助詞 係助詞 * は は は },
                 %w{ 接尾辞 助数 * 二羽 2わ 2羽 },
                 %w{ 名詞 名詞 * 鶏 にわとり 鶏 },
                 %w{ 助詞 格助詞 * が が が },
                 %w{ 動詞 一段 未然ウ接続 い い い },
                 %w{ 助動詞 助動詞ます 基本形 ます ま ま },
                 %w{ 特殊 句点 * 。 。 。 },
                ]
      keys = {
        0 => 'POS',
        3 => 'Surface',
        4 => 'Reading',
        5 => 'Baseform',
      }

      idx = 0
      xml_doc.elements.each('ResultSet/Result/ChunkList/Chunk') do |chunk|
        chunk.elements.each('MorphemList/Morphem') do |morphem|
          r = results[idx]
          keys.each do |k, v|
            morphem.elements[v].text.should be_eql r[k]
          end
          idx += 1
        end
      end
    end

    it 'should create parsed array' do
      parsed_array = @y.parsed_array

      result = [
                { 'POS' => '名詞',   'Surface' => 'うち', },
                { 'POS' => '助詞',   'Surface' => 'の', },
                { 'POS' => '名詞',   'Surface' => '庭', },
                { 'POS' => '助詞',   'Surface' => 'に', },
                { 'POS' => '助詞',   'Surface' => 'は', },
                { 'POS' => '接尾辞', 'Surface' => '二羽', },
                { 'POS' => '名詞',   'Surface' =>  '鶏', },
                { 'POS' => '助詞',   'Surface' => 'が', },
                { 'POS' => '動詞',   'Surface' => 'い', },
                { 'POS' => '助動詞', 'Surface' => 'ます', },
                { 'POS' => '特殊',   'Surface' => '。', },
               ]
      parsed_array.should be_eql result
    end
  end
end
