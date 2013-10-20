require 'mini_exiftool'

module Dpo

  class DestByTime

    attr_reader :filename, :dstpath

    def initialize(filename)
      
      photo = MiniExiftool.new filename
      created = photo['CreateDate']

      @filename = created.strftime('%Y%m%d_%H%M%S')
      
      @dstpath = Pathname.new(created.strftime('%Y'))  
      @dstpath +=created.strftime('%F')

    end

  end
end