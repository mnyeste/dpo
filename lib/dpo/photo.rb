require 'mini_exiftool'

module Dpo

  class Photo

    include Dpo::Logging

    def initialize(path) 
      
      @path = Pathname.new(path);
      raise RuntimeError.new('Photo file not found') unless @path.file?

      exif_data = MiniExiftool.new(@path.to_path); 

      @date_time_original = exif_data['DateTimeOriginal'];
      raise RuntimeError.new('CreateDate EXIF tag missing') unless @date_time_original.instance_of?(Time);

      @sub_sec_time_original = exif_data['SubSecTimeOriginal'];

    end

  end

end