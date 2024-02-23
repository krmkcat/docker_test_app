namespace :get_shop_data do
  desc 'まねきねこの店舗情報を取得'
  task manekineko: :environment do
    require 'selenium-webdriver'

    # ブラウザの設定（ここではChromeを例とします）
    driver = Selenium::WebDriver.for :chrome

    # ページにアクセス
    driver.get 'https://www.karaokemanekineko.jp/locations/?id=258'

    # JavaScriptによって動的に生成された要素を待つ
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # 10秒待つ
    wait.until { driver.find_element(css: '.storeDetail__storeName__storeName').size > 0 }

    # リンク要素を全て取得
    element = driver.find_element(css: '.storeDetail__storeName__storeName')

    # 各リンク要素からhref属性を取得して表示
    shop = Shop.new(name: element.text)
    if shop.save
      puts '店舗を保存しました'
    else
      puts '保存に失敗しました'
    end

    # ブラウザを閉じる
    driver.quit

  end
end