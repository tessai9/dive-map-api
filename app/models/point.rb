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
class Point < ApplicationRecord
  belongs_to :region, optional: false

  delegate :name, to: :region, prefix: true

  with_options presence: true do
    validates :name
    validates :region
  end
end
