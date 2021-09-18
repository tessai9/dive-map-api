# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  birthday        :date
#  email           :string
#  name            :string
#  password_digest :string
#  role            :integer          default("common"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  enum role: {
         admin: 0,
         official: 1,
         common: 2
       }

  with_options presence: true do
    validates :name
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }
    validates :role
    validates :birthday
  end
end
