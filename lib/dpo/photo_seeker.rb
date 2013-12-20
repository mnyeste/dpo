module Dpo

  class PhotoSeeker
    
    def initialize(start_dir, filter = [])
      @start_dir = Pathname.new(start_dir)
      unless @start_dir.directory?
        raise RuntimeError.new('Folder not found: ' + start_dir) 
      end

      @filter = filter
    end

    def seek(fn=nil)

    end
  
  end

end