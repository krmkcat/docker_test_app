namespace :get_shop_data do
  desc 'まねきねこの店舗情報を取得'
  task manekineko: :environment do
    require 'selenium-webdriver'

    # Firefoxのオプションを設定
    options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
    
    # WebDriverの初期化
    driver = Selenium::WebDriver.for :firefox, options: options

    # スクレイピングしたいURLにアクセス
    driver.get('https://www.karaokemanekineko.jp/locations/?id=258')

    # HTMLを取得
    html = driver.page_source

    # Nokogiriでパース
    doc = Nokogiri::HTML(html)

    # 必要なデータを抽出
    # 例: doc.xpath('//h1').text
    shop_name = doc.css('.storeDetail__storeName__storeName').text
    puts shop_name

    # WebDriverを終了
    driver.quit

  end
end