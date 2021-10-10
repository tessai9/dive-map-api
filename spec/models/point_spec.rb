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
require 'rails_helper'

# RSpec.describe Point, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
