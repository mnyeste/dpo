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

      Dir::glob(@incoming_dir + '*.jpg',  File::FNM_CASEFOLD) do |src|

        photo = Photo.new(src) 

        begin
          dst =  @organized_dir + Destination::date_time_original(photo.exif_data, '.jpg')
        
          FileUtils.mkdir_p(dst.dirname)
          FileUtils.move(src,  dst)

        rescue RuntimeError
          puts 'can\'t move: ' + src
        end



      end

    end

  end
end