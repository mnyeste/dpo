module Dpo

  class Fingerprint

    @@fingerprints = {
      { "Model"=>"NIKON D3200",
        "FileType"=>"JPEG",
        } => 'nikon-d3200',
      { "Model"=>"Canon PowerShot S5 IS" } => 'canon-s5'
    }



    def initialize(exif_data)
      @exif_data = exif_data
    end

    def camera
      @@fingerprints.each{|fingerprint, model|
        return model if (fingerprint.to_a & @exif_data.to_a).size == fingerprint.size
      }
      return nil
    end


  end

end
