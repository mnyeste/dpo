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

    end

  end
end