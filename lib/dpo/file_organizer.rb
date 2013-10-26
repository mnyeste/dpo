module Dpo
  class FileOrganizer

    def initialize(incoming, organized)

      @incoming_dir = Pathname.new(incoming)

      unless @incoming_dir.directory?
        raise RuntimeError.new('Incoming folder not found') 
      end

      @organized_dir = Pathname.new(organized)

      unless @organized_dir.exist?
        Dir::mkdir(organized) 
      end 

    end

    def move

      Dir::glob(@incoming_dir + '*.jpg',  File::FNM_CASEFOLD) do |file|

        puts file
      end

    end

  end
end