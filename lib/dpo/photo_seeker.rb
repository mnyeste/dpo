module Dpo

  class PhotoSeeker
    
    def initialize(folder)
      @folder = Pathname.new(folder)
      unless @folder.directory?
        raise RuntimeError.new('Folder not found: ' + folder) 
      end
    end

    def seek
      Dir.glob("#{@folder}/**/*.jpg", File::FNM_CASEFOLD)
    end
  
  end

end