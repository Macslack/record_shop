require("minitest/autorun")
require("minitest/rg")
require_relative("../album.rb")

class TestAlbum < MiniTest::Test
  def setup()
    @album = Album.new({
      "name" => "Vengaboys",
      "quantity" => "10"
      })
  end

  def test_get_album_name__expecting_Vengaboys()
    assert_equal('Vengaboys', @album.name)
  end

  def test_get_album_quantity_expecting_10()
      assert_equal(10, @album.quantity)
  end
end
