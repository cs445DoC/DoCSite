Given /the following employees exist/ do |employees_table|
  employees_table.hashes.each do |employee|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    u = User.create(email: employee["email"], encrypted_password: BCrypt::Password.create(employee["encrypted_password"]), last_name: employee["last_name"], boss_privileges: employee["boss_privileges"])

    if employee["boss_privileges"].downcase == "true"
      u.give_boss_privileges
      u.save
    end

  end
end

Given /^I am an employee without boss privileges$/ do
  u = User.find_by_boss_privileges(false)

    step %{I am on the login page}
    step %{I fill in "user_email" with "empl@gmail.com"}
    step %{I fill in "user_encrypted_password" with "emplpass"}
    step %{I press "Login"}
    step %{I should be on the employee homepage}

end

Given /^I am an employee with boss privileges$/ do
  u = User.find_by_boss_privileges(true)

    step %{I am on the login page}
    step %{I fill in "user_email" with "empl@gmail.com"}
    step %{I fill in "user_encrypted_password" with "emplpass"}
    step %{I press "Login"}
    step %{I should be on the employee homepage}
end
