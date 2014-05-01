require 'spec_helper'

describe User do
	let(:usr) { User.create(first_name: 'Bob' , last_name: 'Loblaw', encrypted_password: 'walkLikeAnEncryption', email: 'myemail@your.com', boss_privileges: false, currently_employed: true) }

  it "is invalid without a first_name last_name" do
	usr.first_name = nil
	expect(usr.valid?).to eq(false)
  end
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
it "is invalid without currently_employed" do
	usr.currently_employed = nil
	expect(usr.valid?).to eq(false)
  end
  it "is invalid without boss_privileges" do
	usr.boss_privileges = nil
	expect(usr.valid?).to eq(false)
  end
end
