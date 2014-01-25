require "test_helper"

class FingerprintTest < MiniTest::Unit::TestCase
  
  def test_fingerprint_match

    stub_exif = {
      "MIMEType"=>"image/jpeg",
      "JFIFVersion"=>1.01,
      "FileType"=>"JPEG",
      "Model"=>"Canon PowerShot S5 IS"
    }

    f = Dpo::Fingerprint.new(stub_exif)

    assert_equal("canon-s5", f.camera)
  end

  def test_partial_fingerprint_doesnt_match
    f = Dpo::Fingerprint.new({"Model"=>"NIKON D3200"})
    assert_nil(f.camera)
  end

  def test_fake_exif_doesnt_match
    f = Dpo::Fingerprint.new({"ABC"=>"NIKON D3200"})
    assert_nil(f.camera)
  end

  def test_empty_exif_doesnt_match
    f = Dpo::Fingerprint.new({})
    assert_nil(f.camera)
  end
end
