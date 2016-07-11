After do |scenario|
  begin
    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      # puts screenshot
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  ensure  
    @browser.close
  end  
end