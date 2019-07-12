
# This ruby script is to be called by gitlab-rails runner 
# e.g gitlab-rails runner cleandb.rb eb9f5f44dbb3fac727314e9c98bb0f67e5fd33240ed83cd7267afd065bd423b8 b41ece47d0ad891d8b9307c0f27b50d0daaaaa7495dfa007aa12968a8cc68a6eoids 
# oids passed to his script is removed from the GitLab databese
# author: darshan.pradhan@anu.edu.au 

if ARGV.empty?
  puts "oid was not passed to the script to lookup database"
  exit 0
end

for oid in ARGV
    # get the LFS Object by oid
    lfs_object = LfsObject.find_by(oid: oid)

    if !lfs_object.nil?
       # remove the object if it is not nil
      puts "removing " +oid+ " from database"
      lfs_object.destroy
    else
      puts oid +" not in database"
    end
end
