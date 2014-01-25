module Dpo

  class Fingerprint

    @@fingerprints = {
      { "Model"=>"NIKON D3200",
        "FileType"=>"JPEG",
        } => 'nikon-d3200',
      { "Model"=>"Canon PowerShot S5 IS",
        "FileType"=>"JPEG",
        } => 'canon-s5'
    }

    attr_reader :camera

    def initialize(exif_data)

      @@fingerprints.each{|fingerprint, model|
        if (fingerprint.to_a & exif_data.to_a).size == fingerprint.size
          @camera = model
        end
      }

    end

  end

end
