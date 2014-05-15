require 'spec_helper'

describe MainController do
  describe 'application form' do
    it 'should render the form' do
      get 'job_application'
      response.should render_template('job_application')
    end

    it 'should redirect upon successful submission' do
      post 'job_application', job_application: { name: 'John Doe', phone: '1234567890', email: 'john.doe@fakemail.com', crime: false, drive: true }
      response.should be_redirect
    end

    it 'should render the form upon failed submission' do
      post 'job_application', job_application: { name: '', phone: '1234567890', email: 'john.doe@fakemail.com', crime: false, drive: true }
      response.should render_template('job_application')
    end

    it 'should make name available to template upon failed submission' do
      post 'job_application', job_application: { name: 'John Doe', phone: '', email: 'john.doe@fakemail.com', crime: false, drive: true }
      assigns(:name).should == 'John Doe'
    end
  end
end
