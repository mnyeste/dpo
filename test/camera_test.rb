require "test_helper"

class CameraTest < MiniTest::Unit::TestCase

  def test_defy
    assert_equal("defy", Dpo::Camera.id("MB525 19260002ffdc00000163d4701401200e"))
  end

  def test_canon_s5
    assert_equal("canon-s5", Dpo::Camera.id("Canon PowerShot S5 IS"))
  end

  def test_lumix_ls80
    assert_equal("lumix-ls80", Dpo::Camera.id("DMC-LS80"))
  end

  def test_nikon_d3200
    assert_equal("nikon-d3200", Dpo::Camera.id("NIKON D3200"))
  end

  def test_unkonwn
    assert_nil(Dpo::Camera.id("New camera model"))
  end

end