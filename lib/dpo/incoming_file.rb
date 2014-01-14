require 'mini_exiftool'

module Dpo

  class IncomingFile

    attr_reader :exif_data, :path, :basename, :extension

    def initialize(path) 
      @path = Pathname.new(path)
      raise RuntimeError.new('Incoming file not found') unless @path.file?

      @exif_data = MiniExiftool.new(@path.to_path).to_hash 
      @basename = @path.basename
      @extension = @path.extname
    end
  end
end