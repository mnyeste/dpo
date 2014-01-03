module Dpo

  class PhotoSeeker
    
    attr_reader :photos

    def initialize(folder)
      @folder = Pathname.new(folder)
      unless @folder.directory?
        raise RuntimeError.new('Folder not found: ' + folder) 
      end

      @photos=Dir.glob("#{@folder}/**/*.jpg", File::FNM_CASEFOLD)

    end

  end

end