require 'mini_exiftool'

module Dpo

  class Destination

    EXIF_TAG_DTO = 'DateTimeOriginal'
    EXIF_TAG_SSTO = 'SubSecTimeOriginal'

    def self.date_time_original(exif_data)

      dto = exif_data[EXIF_TAG_DTO]

      raise RuntimeError unless dto

      ssto = exif_data[EXIF_TAG_SSTO]

      dstpath = Pathname.new dto.strftime('%Y')
      dstpath += dto.strftime('%F')

      filename = dto.strftime('%Y%m%d_%H%M%S')

      if ssto 
        filename += ('_' + ssto)
      end

      dstpath += filename 

    end
  end
end