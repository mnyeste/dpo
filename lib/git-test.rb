require 'rugged'


repo = Rugged::Repository.new('/home/mnyeste/projects/dpo/build/spec_workspace/organized')

sha_hash = Rugged::Repository.hash_file('/home/mnyeste/projects/dpo/build/spec_workspace/organized/2013/2013-10-08/20131008_134848_50.jpg', :blob)

puts repo.exists?(sha_hash)
