# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean
#  name                   :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  attr_reader :user, :admin

  def setup
    @user = users(:user1)
    @admin = users(:admin)
  end
  test 'should be valid' do
    assert user.valid?
  end

  test 'should have an email' do
    user.email = ''
    assert_not user.valid?
  end

  test 'should have a password' do
    user.password = ''
    assert_not user.valid?
  end

  test 'should not be an admin by default' do
    assert_not user.admin?
  end

  test 'admin user should be an admin' do
    assert admin.admin?
  end
end
