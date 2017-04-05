Given (/^"([^"]*)", check 404 from file: "([^"]*)" with legacy RCSB domain$/) do | category, filename_directory |

  frameworkDirectory = File.expand_path('../../..', __FILE__)
  domainURL = ENV['URL']

  File.open(frameworkDirectory + filename_directory, "r") do |f|
    f.each_line do |line|
      if category == "structures"
        url = domainURL + "/pdb/explore/explore.do?structureId=#{line}"
      elsif category == "ligands"
        # url = domainURL + "/pdb/ligand/ligandsummary.do?hetId=#{line}"
        url = domainURL + "/ligand/#{line}"
      else
        puts "Need to check category"
      end

      @browser.goto url
      # puts @browser.url
      page_exist = @browser.image(:id => "rcsblogo").exists?
      id_exist = @browser.h1.exists?
      expect(page_exist).to be true

      if page_exist == true
        if id_exist == true
          puts line
        else
          puts line + " - DOESN'T EXIST"
        end
      else
        puts line + " - Page 404"
      end
    end
  end
end

And (/^check 404 from external file: "([^"]*)"$/) do | filename_url |
  domainURL = ENV['URL']
  open(filename_url) do |f|
    f.each_line.with_index do |line, line_num|
      if (line_num == 50)
        url = URI.parse("http://" + domainURL + "/pdb/explore/explore.do?structureId=#{line}")
        req = Net::HTTP.new(url.host, url.port)
        res = req.request_head(url.path)
        puts res.code
      end
    end
  end
end

And /^check the number of recent structure entries$/ do
  external_url = "http://sandboxwest.rcsb.org:10601/ftp-v3-support/update-lists/added-entries"
  file = open(external_url,"r")
  @recent_entries_count = file.readlines.size
  puts	@recent_entries_count
end

