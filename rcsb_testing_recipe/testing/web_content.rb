require 'open-uri'

# Added Entries
open('http://sandboxwest.rcsb.org:10601/ftp-v3-support/update-lists/added-entries') do |f|
  f.each_line do |line|
    puts line
  end
end