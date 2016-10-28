module CommonPageElements
	include PageObject

  # Text and link of Current Structure Count
  p(:current_structure_count) {
    h2_element(:id => 'tagline').link_element(:id => 'CurrentStructureCount')
  }

  link(:all_holdings_link, :id => 'CurrentStructureCount')

  # Browser Title
  def browser_title
    @browser.title
  end

  # Current URL
  def current_url
    @browser.url
  end
     
  # Screenshot after page is loaded - COMMON FUNCTION
  def screenshot=(page_name)
    sleep 1
	  @browser.screenshot.save 'screenshot_' + page_name + '.png'
	end

  def tomorrow
    (Date.today + 1).to_s
  end

# Continue element if it is visible
  def continue_when_ready
    wait_until(5, "Continue element not visible in 5 seconds") do
      continue_element.visible? 
    end
    continue
  end
	 
# Retry for flaky test scenarios
  def retry_action (initial_wait_time_in_seconds=3, max_attempts=3, &block)
      num_tries = 0
      wait_time = 1
      successful = false

      while (num_tries <= max_attempts && !successful)
        begin
          block.call
          successful = true
        rescue StandardError => ex
          num_tries += 1
          wait_time *= initial_wait_time_in_seconds
          sleep(wait_time)
        end
      end
    end

end