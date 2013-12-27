require 'mini_exiftool'

module Dpo

  class Destination

    EXIF_TAG_DTO = 'DateTimeOriginal'
    EXIF_TAG_SSTO = 'SubSecTimeOriginal'

    def self.folder(exif_data)
      dto = exif_data[EXIF_TAG_DTO]

      raise RuntimeError.new("EXIF tag [#{EXIF_TAG_DTO}] does not exist") unless dto

      dstpath = Pathname.new dto.strftime('%Y')
      dstpath += dto.strftime('%F')
    end

    def self.file(exif_data, extension)
      dto = exif_data[EXIF_TAG_DTO]
      raise RuntimeError.new("EXIF tag [#{EXIF_TAG_DTO}] does not exist") unless dto

      filename = dto.strftime('%Y%m%d_%H%M%S')

      ssto = exif_data[EXIF_TAG_SSTO]

      if ssto 
        filename += ('_' + ssto.to_s)
      end

      filename += extension
    end 

  end
end