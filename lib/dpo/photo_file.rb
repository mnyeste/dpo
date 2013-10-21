module Dpo

  class PhotoFile

    include Dpo::Logging

    def initialize(path) 
      
      @original_path = path
      Pathname.new(@original_path).exist?

      log.info(Pathname.new(@original_path).exist?)

    end

  end

end