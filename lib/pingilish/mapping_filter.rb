# encoding: utf-8
class MappingFilter
  PERSIAN_CHARS = "۱۲۳۴۵۶۷۸۹۰،×؛ابپتثجحدذرزسصضطظفکگلمنك؟"
  ENGLISH_CHARS = "1234567890,*;abptsjhdzrzssztzfkglmnk?" 
  
  CHAR_MAP_FILE_PATH = File.join(File.dirname(__FILE__), '../../db/char_maps.yml')
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

