# Add a declarative step here for populating the DB with movies.

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

Then /the director of "(.*)" should be "(.*)"/ do |mov, dir|

  movie = Movie.find_by_title(mov)
  movie.director.equal?(dir)

end
