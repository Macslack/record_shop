require("minitest/autorun")
require("minitest/rg")
require_relative("../album.rb")
require("pry-byebug")

class TestAlbum < MiniTest::Test
  def setup()
    @album = Album.new({
      "name" => "Vengaboys",
      "quantity" => "10",
      "buy_price" => "15",
      "sell_price" => "20"
      })

    @album2 = Album.new({
      "name" => "Murcof",
      "quantity" => "16",
      "buy_price" => "20",
      "sell_price" => "30"
      })

    @album3 = Album.new({
      "name" => "Lo Moon",
      "quantity" => "50",
      "buy_price" => "30",
      "sell_price" => "40"
      })
#add tests for bad input negitive Quantity
#blank name etc


  end
# binding.pry
  def test_get_album_name__expecting_Vengaboys()
    assert_equal('Vengaboys', @album.name)
  end

  def test_get_album_quantity_expecting_10()
      assert_equal(10, @album.quantity)
  end

  def test_get_album_stock_level__expecting_low()
      assert_equal("Low", @album.stock_level())
  end

  def test_get_album_stock_level_expecting_medium()
      assert_equal("Medium", @album2.stock_level())
  end

  def test_get_album_stock_level_expecting_high()
      assert_equal("High", @album3.stock_level())
  end

  def test_get_album_buy_price_expecting_15()
      assert_equal(15, @album.buy_price)
  end

  def test_get_album_sell_price_expecting_20
    assert_equal(20, @album.sell_price)
  end
end
