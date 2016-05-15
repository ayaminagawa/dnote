# 使用するモデルファイル(test)を読み込む
require "#{Rails.root}/app/models/food_info"
require 'open-uri'
require 'nokogiri'

class Tasks::FoodInfoTask
  def self.import

    columns = FoodInfo.column_names

    i = 1001

    while i <= 18016 do
      food_info = FoodInfo.new

      if i < 10000
        url = "http://fooddb.mext.go.jp/details/details.pl?ITEM_NO=10_0#{i}_6"
      else
        url = "http://fooddb.mext.go.jp/details/details.pl?ITEM_NO=10_#{i}_6"
      end
      charset = nil

      html = open(url) do |f|
        charset = f.charset # 文字種別を取得
        f.read # htmlを読み込んで変数htmlに渡す
      end

      if html.match(/ERROR/)
        i = i + 1000 - (i % 1000) + 1
        puts "next!!"
        next
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)

      food_info.item_no = doc.css(".food_name").first.text.match(/：\[(.*?)\]/)[1].to_i
      # food_info.name = doc.css(".food_name").first.text.gsub(/\[食品番号\]/, '')
      food_info.name = doc.css(".food_name").first.text

      doc.css("td.num, td.marker").each_with_index do |node, index|
        eval("food_info.#{columns[index + 3]} = node.inner_text.to_f")
      end

      food_info.save
      puts "item_no: #{food_info.item_no}"
      i += 1
    end
  end

  def self.fix
    FoodInfo.all.each do |food_info|
      food_info.update(name: food_info.name.gsub(/\[食品番号\].*?\] /, ''))
    end
  end
end