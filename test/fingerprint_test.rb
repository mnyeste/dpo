require "test_helper"

class CameraTest < MiniTest::Unit::TestCase

  def test_fingerprint_match 

    assert_equal("canon-s5", Dpo::Fingerprint.camera({"FileType"=>"JPEG", "Model"=>"Canon PowerShot S5 IS"}))

  end

end