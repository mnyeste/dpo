require 'rubygems' 
require 'bundler/setup'

require 'open-uri'
require 'mini_exiftool'

# Fetch an external photo
filename = open('../samples/nikon_d3200_1.jpg').path

puts Dir.pwd

# Read the metadata
photo = MiniExiftool.new(filename, {:timestamps => DateTime})
#photo = MiniExiftool.new(filename)


# Print the metadata
#photo.tags.compact.sort.each do |tag|
  #puts "#{tag}: #{photo[tag]}"
#  puts tag.ljust(28) + photo[tag].to_s
#end

puts photo['CreateDate']
puts photo['DateTimeOriginal']
puts photo['SubSecTimeOriginal']

photo.timestamps = Time
photo.reload

puts photo['CreateDate']
puts photo['DateTimeOriginal']
puts photo['SubSecTimeOriginal']

