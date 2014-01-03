require 'mini_exiftool'

module Dpo

  class Photo

    attr_reader :exif_data

    def initialize(path) 
      
      @path = Pathname.new(path)
      raise RuntimeError.new('Photo file not found') unless @path.file?

      @exif_data = MiniExiftool.new(@path.to_path).to_hash 
    end

  end

end