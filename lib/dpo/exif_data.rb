require 'mini_exiftool'

module Dpo

  class ExifData

    attr_reader :filename

    def initialize(filename)
      photo = MiniExiftool.new filename
      
      @filename = photo['CreateDate'].strftime('%Y%m%d_%H%M%S')
    
    end



  end
end