# == Schema Information
#
# Table name: points
#
#  id         :bigint           not null, primary key
#  name       :string
#  point_map  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :bigint           not null
#
# Indexes
#
#  index_points_on_region_id  (region_id)
#
# Foreign Keys
#
#  fk_rails_...  (region_id => regions.id)
#
FactoryBot.define do
  factory :point do
    name { "MyString" }
    point_map { "MyString" }
    region { nil }
  end
end
