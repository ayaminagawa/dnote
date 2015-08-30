# 使用するモデルファイル(test)を読み込む
require "#{Rails.root}/app/models/food_info"
require 'open-uri'
require 'nokogiri'

class Tasks::FoodInfoTask
  def self.import

    food_info = FoodInfo.new
    columns = FoodInfo.column_names

    url = 'http://fooddb.mext.go.jp/details/details.pl?ITEM_NO=11_11198_6'
    charset = nil

    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    food_info.item_no = doc.css(".food_name").first.text.match(/：\[(.*?)\]/)[1].to_i
    # food_info.name = doc.css(".food_name").first.text.gsub(/\[食品番号\]/, '')
    food_info.name = doc.css(".food_name").first.text

    doc.css("td.num, td.marker").each_with_index do |node, index|
      p node.text
      eval("food_info.#{columns[index + 3]} = node.inner_text.to_f")
    end

    food_info.save


  end
end