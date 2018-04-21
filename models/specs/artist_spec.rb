require("minitest/autorun")
require("minitest/rg")
require_relative("../artist.rb")

class TestArtist < MiniTest::Test
  def setup()
    @artist = Artist.new('name')
  end

  def test_get_artist_name__expecting_name()
    assert_equal('name', @artist.name)
  end
end
