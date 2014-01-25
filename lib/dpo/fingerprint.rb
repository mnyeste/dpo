module Dpo

  class Fingerprint

    attr_reader :camera, :extension

    @@fingerprints = {
      { "Model"=>"NIKON D3200",
        "FileType"=>"JPEG",
      } => { :camera=>'nikon-d3200',
             :extension=>'jpg'},
      { "Model"=>"Canon PowerShot S5 IS",
        "FileType"=>"JPEG",
      } => { :camera=>'canon-s5',
             :extension=>'jpg'}
    }


    def initialize(exif_data)

      @@fingerprints.each{|pattern, result|
        if (pattern.to_a & exif_data.to_a).size == pattern.size
          @camera = result[:camera]
          @extension = result[:extension]
        end
      }

    end

  end

end
