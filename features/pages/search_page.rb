class SearchPage
  def search(user)
    fill_in :user, user
    click 'Enter'
  end

  def visit
    visit "/login"
  end
end