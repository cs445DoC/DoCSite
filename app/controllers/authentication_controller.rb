class AuthenticationController < ApplicationController
  def change_password
  end

  def forgot_password
  end

  def password_sent
  end

  def account_settings
    @user = current_user
  end

  def set_account_info

    old_user = current_user

  # verify the current password by creating a new user record.
    @user = User.authenticate(old_user.email, params[:user][:encrypted_password])


  # verify
    if @user.nil?
      @user = current_user
      @user.errors[:encrypted_password] = "Password is incorrect."

      flash[:notice] = "Password NOT changed: please make sure you enter your original password correctly."

      render :action => "account_settings"
    else
      if @user.valid?
        # If there is a new_password value, then we need to update the password.

	if check_password_confirmation
          @user.encrypted_password = BCrypt::Password.create(params[:user][:new_password])
          @user.save
          flash[:notice] = 'Account settings have been changed.'
          redirect_to '/users/account_settings'
        else 
          flash[:notice] = "The \"password confirmation\" field did not match \"new password\" field. Account setting have NOT been changed."
          render :action => "account_settings"
        end

      else
        flash[:notice] = "Account setting have NOT been changed. Please check your spelling."


        render :action => "account_settings"
      end
    end
  end
 
  def create_employee

    flash[:notice] = "Am I a Boss?: " + current_user.boss_privileges.to_s

    if !(current_user.boss_privileges)

       unauthorized

    else
    
    @user = User.new
    
    end 
 end
  
  def register
    @user = User.new(:first_name => params[:user][:first_name], :last_name => params[:user][:last_name], :encrypted_password => params[:user][:encrypted_password], :email => params[:user][:email])

    @user.encrypted_password = BCrypt::Password.create(@user.encrypted_password)

    params[:user].each do |p, v|
	puts p + ", " + v
    end

    if @user.valid? && @user.encrypted_password != nil
      @user.save
      flash[:notice] = 'User successfully created.'
      redirect_to '/users/show'
    else
      flash[:notice] = "An error occurred. The new employee was not created."
      redirect_to '/create_employee'
    end
  end
   
  def sign_in
    @user = User.new
  end

  def signed_out
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
  end

  def login

    email = params[:user][:email]
    password = params[:user][:encrypted_password]

    user = User.authenticate(email, password)

    if user
      session[:user_id] = user.id
      flash[:notice] = 'Welcome.'

      redirect_to "/users/show"

    else
        flash.now[:error] = 'Unknown user. Please check your username and password.'
        render :action => "sign_in"
    end
  end

<<<<<<< HEAD

=======
>>>>>>> users can change their passwords, better error messages and checking
  def check_password_confirmation
    if params[:user][:new_password] == params[:user][:new_password_confirmation]
      return true
    else
      return false
    end 
  end

<<<<<<< HEAD
  def unauthorized
     render :status => :forbidden, :text => "You do not have permission to view this page. Press 'Back' in your browser. Contact your administrator if you have any questions or belieive you should not be seeing this page."
  end
=======
>>>>>>> users can change their passwords, better error messages and checking
end
