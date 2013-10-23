require 'mini_exiftool'

module Dpo

  class Photo

    include Dpo::Logging

    def initialize(path) 
      
      @path = Pathname.new(path);
      raise RuntimeError.new('Photo file not found') unless @path.file?

      @create_date = MiniExiftool.new(@path.to_path)['CreateDate'];
      raise RuntimeError.new('CreateDate EXIF tag missing') unless @create_date.instance_of?(Time)

    end


  end

end