require 'cap_helper'

module CommonUtil
  include Capybara::DSL # need this if we use Capybara-specific methods, like "visit".

  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop do
        break if page.evaluate_script('jQuery.active') == 0
      end
    end
  end
  
  def unique_account_name
    "QA Test Acct #{unique_id}"
  end

  def unique_name
    "QA User Name #{unique_id}"
  end

  #...

  def unique_id
    @unique_id ||= "#{Time.now.strftime("%Y%m%d_%H%M%S")}"
  end

  def tomorrow
    (Date.today + 1).to_s
  end

  #...

  def sauce_driver?
    Capybara.default_driver == :sauce
  end

  def selenium_driver?
    Capybara.default_driver == :selenium
  end
  
  def webkit_driver?
    Capybara.default_driver == :webkit
  end

  def set_default_wait_time(time_in_sec)
    Capybara.default_wait_time = time_in_sec
  end

  # this is useful for setting the time quickly in debugger. 
  alias_method :st, :set_default_wait_time

  def teardown
    # page.driver.browser.quit #if !webkit_driver?
    if sauce_driver? 
      @current_job_id = job_id  # keep the old session_id before it gets destroyed
      page.driver.finish!       # Thanks, John Gesimondo, for this awesome solution!
    else
      Capybara.reset_sessions! 
    end
  end

  #...

  def find_element_with_this_wording(wording, options={})
    options[:tag] ||= "a" 
    options[:command] ||= "find" # default is "find". Other option is "first" 

    find_cmd = "#{options[:command]}(:xpath, \"//#{options[:tag]}[text()='#{wording}']\")"

    if !options[:within] 
      eval(find_cmd)
    else 
      case options[:within]
        when "side nav bar"
          if hamburger_menu_visible?
            within_css = "#secondary_navigation"
            hamburger_menu.click
          else
            within_css = "#primary_navigation"
          end

          within within_css do  
            eval(find_cmd)
          end
        #... 
        else
          puts "specified 'within' section is not yet implemented."
        end
    end
  end

  #...

  def retry_action(initial_wait_time_in_seconds=3, max_attempts=3, &block)
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

  def click_alert_popup
    if selenium_driver? || sauce_driver?
      page.driver.browser.switch_to.alert.accept
    else
      #webkit
      page.driver.browser.accept_js_confirms
    end
  end
end
