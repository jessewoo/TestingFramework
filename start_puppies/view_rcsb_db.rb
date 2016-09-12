#!/usr/bin/ruby

require 'mysql'  

begin
    con = Mysql.new 'db-developer1.rcsb.org:8888', 'developer'
    rs = con.query('SELECT * FROM aerospaci')

    rs.each do |row|
        puts row.join("\s")
    end
        
    
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end