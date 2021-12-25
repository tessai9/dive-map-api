# frozen_string_literal: true

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
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    password { SecureRandom.alphanumeric(8) }
    sequence(:email) { |n| 'diver#{n}@example.com' }
    birthday { '1994-02-23' }

    trait :admin_user do
      role { 0 }
    end

    trait :official_user do
      role { 1 }
    end

    trait :common_user do
      role { 2 }
    end
  end
end
