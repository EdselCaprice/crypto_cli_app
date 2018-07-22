
class CryptoCliApp::Crypto
  attr_accessor :price, :pair, :volume, :exchange_1, :exchange_2, :market_cap, :change_percentage, :coin, :coin_url, :selection

  @@all = []
  def initialize(attribute_hash = nil)
   attribute_hash.each {|key, value| self.send(("#{key}="), value)} if attribute_hash != nil
   @@all << self
  end

  def self.create_from_collection(coin_array)
    coin_array.each {|attribute_hash| CryptoCliApp::Crypto.new(attribute_hash)}
  end



  def top_crypto #will new to scrape this data from CoinMarketCap.com
    i = 0
    @@all[0..24].each {|crypto| puts "#{i += 1}. #{crypto.coin}"}
  end

  def crypto_exchange(input)
    #displays average price, market cap, 24h volume, change%. Also offers user to drill down on top two exchanges to view most popular trading pairs
    @selection = @@all[input.to_i-1]
    puts "#{@@all[input.to_i-1].coin} is currently being traded for an average price of #{@@all[input.to_i-1].price}"
    puts "Current Market Capitalization: #{@@all[input.to_i-1].market_cap}"
    puts "24 Hour Trading Volume: #{@@all[input.to_i-1].volume}"
    puts "24 Hour Change Percentage: #{@@all[input.to_i-1].change_percentage}"
    puts "#{@@all[input.to_i-1].coin} is heavily traded on:"
    puts "1. #{@@all[input.to_i-1].exchange_1}"
    puts "2. #{@@all[input.to_i-1].exchange_2}"
  end


  def crypto_exchange_price(input)
    #displays trading price, volume, and trading pair for the selected exchange
    puts "This coin is currently trading at $1.25 USD on this exchange"
    @selection.exchange_1_price
    @selection.exchange_2_price
  end






end
