# encoding: utf-8
require './lib/pingilish'
farsi_txt = File.open("data/persian.txt", "r:UTF-8", &:read)
far = Pingilish.new(farsi_txt)

puts far.to_pingilish
 
pin = Farsi.new("dar inke molana aref e bozorgi boodeh man shakki nadaram vali in harf hayee ke inja zadeh az bikh chert o perte hamash. baraye ine ke begim chizi ro ke masalan anishtain gofte ghablan molana gofte bood")
puts pin.to_farsi
 
# Pingilish.update_db( {"ولی" => "vali"} )
# Pingilish.update_db( {"مثلا" => "masalan"} )
# Pingilish.update_db( {"چرت" => {"chert" => 5 ,"chort" => 4}} )



# require "test/unit"
# 
# require "pinglish"
# 
# class Test < Test::Unit::TestCase
#   def test_case_name
#     
#   end
# end
