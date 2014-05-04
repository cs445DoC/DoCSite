require 'spec_helper'

describe User do
	let(:usr) { User.create(first_name: 'Bob' , last_name: 'Loblaw', encrypted_password: 'walkLikeAnEncryption', email: 'myemail@your.com') }

  it "is invalid without a last_name" do
	usr.last_name = nil
	expect(usr.valid?).to eq(false)
  end
  it "is invalid without encrypted_password" do
	usr.encrypted_password = nil
	expect(usr.valid?).to eq(false)
  end
  it "is invalid without a email" do
	usr.email = nil
	expect(usr.valid?).to eq(false)
  end

end
