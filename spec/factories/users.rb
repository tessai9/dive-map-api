# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  password_digest :string
#  email           :string
#  birthday        :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    name { "MyString" }
    password_digest { "MyString" }
    email { "MyString" }
    birthday { "2021-07-28" }
  end
end
