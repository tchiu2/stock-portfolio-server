namespace :db do 
  desc "Updates symbols table with IEX data"

  task :update_symbols => :environment do
    puts "Fetching stock information from IEX"
    list = Iex::Client.symbols

    puts "Inserting new records"
    list.each do |obj|
      Stock.find_or_create_by(iex_id: obj["iexId"]) do |stock|
        stock.symbol = obj["symbol"]
        stock.name = obj["name"]
        stock.stock_type = obj["type"]
        stock.enabled = obj["isEnabled"]
      end
    end
    puts "Finished updating stocks table"
  end
end
