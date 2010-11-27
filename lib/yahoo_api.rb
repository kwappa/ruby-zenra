# -*- coding: utf-8 -*-
require 'net/http'
require 'cgi'
require 'rexml/document'

class YahooApiDAService
  REQUEST_HOST   = 'jlp.yahooapis.jp'
  API_PATH       = '/DAService/V1/parse'

  def initialize app_id, sentence
    @app_id   = app_id
    @sentence = sentence
    request
    self
  end

  def request
    http  = Net::HTTP.new(REQUEST_HOST,80)
    query = "?appid=#{@app_id}&sentence=#{CGI.escape(@sentence)}"
    req   = Net::HTTP::Get.new(API_PATH + query)
    @response = http.request(req)
  end

  def xml_document
    @xml_doc ||= REXML::Document.new @response.body
    @xml_doc
  end

  def parsed_array
    result = Array.new
    xml_document.elements.each('ResultSet/Result/ChunkList/Chunk') do |chunk|
      chunk.elements.each('MorphemList/Morphem') do |morphem|
        result << {
          'POS'     => morphem.elements['POS'].text,
          'Surface' => morphem.elements['Surface'].text,
        }
      end
    end
    result
  end

end
