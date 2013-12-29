module Dpo

  class Camera
  
    @@known_cameras = {
      "MB525 19260002ffdc00000163d4701401200e" => "defy",
      "Canon PowerShot S5 IS" => "canon-s5",
      "DMC-LS80" => "lumix-ls80",
      "NIKON D3200" => "nikon-d3200"
    }

    def self.id(exif_modelname)
      @@known_cameras[exif_modelname]
    end

  end

end