require 'mini_exiftool'

module Dpo

  class Destination

    EXIF_TAG_DTO = 'DateTimeOriginal'
    EXIF_TAG_SSTO = 'SubSecTimeOriginal'

    def initialize(exif_data, extension)

      @dto = exif_data[EXIF_TAG_DTO]
      raise RuntimeError.new("EXIF tag [#{EXIF_TAG_DTO}] does not exist") unless @dto

      @ssto = exif_data[EXIF_TAG_SSTO]
      @extension = extension

    end

    def folder

      dstpath = Pathname.new @dto.strftime('%Y')
      dstpath += @dto.strftime('%F')
    end

    def file 

      filename = @dto.strftime('%Y%m%d_%H%M%S')

      if @ssto 
        filename += ('_' + @ssto.to_s)
      end

      filename += @extension
    end 

  end
end