namespace :get_shop_data do
  desc 'まねきねこの店舗情報を取得'
  task manekineko: :environment do
    require 'selenium-webdriver'

    # Chromiumのオプションを設定
    options = Selenium::WebDriver::Chrome::Options.new
    options.binary = '/usr/bin/chromium' # Chromiumのバイナリパス
    options.add_argument('--headless') # ヘッドレスモードで実行
    options.add_argument('--disable-gpu') # GPUの使用を無効化（ヘッドレスモードで推奨）
    options.add_argument('--no-sandbox') # セキュリティサンドボックスを無効化
    options.add_argument('--disable-dev-shm-usage') # /dev/shmの使用を無効化

    # WebDriverを設定
    driver = Selenium::WebDriver.for :chrome, options: options

    # スクレイピングしたいURLにアクセス
    driver.get('https://www.karaokemanekineko.jp/locations/?id=258')

    # HTMLを取得
    html = driver.page_source

    # Nokogiriでパース
    doc = Nokogiri::HTML(html)

    # 必要なデータを抽出
    # 例: doc.xpath('//h1').text
    shop_name = doc.css('.storeDetail__storeName__storeName').text
    shop = Shop.new(name: shop_name)

    # WebDriverを終了
    driver.quit

  end
end