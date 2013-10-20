require 'mini_exiftool'

module Dpo

  class ExifData

    attr_reader :filename, :dstpath

    def initialize(filename)
      photo = MiniExiftool.new filename
      
      @filename = photo['CreateDate'].strftime('%Y%m%d_%H%M%S')
      
      @dstpath = Pathname.new(photo['CreateDate'].strftime('%Y'))  
      @dstpath += photo['CreateDate'].strftime('%F')

    end



  end
end