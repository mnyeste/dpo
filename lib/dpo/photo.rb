require 'mini_exiftool'

module Dpo

  class Photo

    include Dpo::Logging

    def initialize(path) 
      
      @path = Pathname.new(path);
      raise RuntimeError.new('Photo file not found') unless @path.file?

      @exif = MiniExiftool.new(@path.to_path)
      raise RuntimeError.new('No exif data') unless @exif['CreateDate']

    end


  end

end