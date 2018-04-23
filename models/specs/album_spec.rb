require("minitest/autorun")
require("minitest/rg")
require_relative("../album.rb")
require("pry-byebug")

class TestAlbum < MiniTest::Test
  def setup()
    @album = Album.new({
      "name" => "Vengaboys",
      "quantity" => "10"
      })

    @album2 = Album.new({
      "name" => "Murcof",
      "quantity" => "16"
      })

    @album3 = Album.new({
      "name" => "Lo Moon",
      "quantity" => "50"
      })



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
end
