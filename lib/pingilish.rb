# encoding: utf-8
require "pingilish/version"
require 'yaml'


module Pingilish
  def self.to_farsi(str)
    pin = Farsi.new(str)
    pin.to_farsi.force_encoding('UTF-8')
  end

  def self.to_default(text)
    db_filter = DbFilter.new(text)
    text = db_filter.process

    # stem_filter = StemFilter.new(text)
    # text = stem_filter.process

    mapping_filter = MappingFilter.new(text)
    text = mapping_filter.process
  end

  class MappingFilter
    PERSIAN_CHARS = "۱۲۳۴۵۶۷۸۹۰،×؛ابپتثجحدذرزسصضطظفکگلمنك؟"
    ENGLISH_CHARS = "1234567890,*;abptsjhdzrzssztzfkglmnk?"

    CHAR_MAP_FILE_PATH = File.join(File.dirname(__FILE__), '../db/char_maps.yml')
    CHAR_MAP = YAML.load_file(CHAR_MAP_FILE_PATH)


    def initialize(text)
      @text = text
    end

    def process
      # general character replacement
      text = @text.to_s.tr(PERSIAN_CHARS,ENGLISH_CHARS)

      CHAR_MAP.each { |k, v| text.gsub!("#{k}","#{v}") }
      return text
      # TODO: make a mapping hash instead of this dirty gsub ing
      # TODO: replace non latin alphabet at the end
      # TODO: return an object with alternatives (like chert/chort)
      # TODO: seperate the login into classes: Tokenizer, StemmingFilter, DbFilter, GeneralMappingFilter
      # TODO: seperate the logic of dealing with a backend in a class, subclass it and write something for YML
      # BUG: major bug, do not replace latin chars that came from DB by latin chars in mapping array!
      # TODO: write the mapping filter interations
    end

  end


class DbFilter
  require 'pingilish/backends/yaml'
  require 'pingilish/tokenizer'

  def initialize(text) 
    @text = text.gsub(/ي/,"ی").gsub(/ك/,"ک") # dealing with non-standard characters
  end
  
  def process
    text = @text
    y_db = YamlBackend.new
    words = Tokenizer.new(@text)
    
    db = y_db.load
    words.tokens.each do |w|
      text = text.gsub(/#{w}/, db[w].to_s) if db[w]
    end
   
    return text
  # BUG: do not gsub just replace the text
  # BUG: case for hash and string
  end
  
end

require 'net/http'
require 'uri'

class Farsi < String
  
  TO_FARSI_SERVICE_URL = "http://www.behnevis.com/php/convert.php"
  TO_FARSI_QUERY_STRING = 'farsi'

  def initialize(text)
    @text = text
  end
  
  def to_farsi
    Net::HTTP.post_form(URI.parse(TO_FARSI_SERVICE_URL), {TO_FARSI_QUERY_STRING => @text.downcase }).body
    # TODO: save the files in yaml
    # TODO: verify that it's persian
  end  

end


end
