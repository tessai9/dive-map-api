# == Schema Information
#
# Table name: regions
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :bigint           not null
#
# Indexes
#
#  index_regions_on_prefecture_id  (prefecture_id)
#
# Foreign Keys
#
#  fk_rails_...  (prefecture_id => prefectures.id)
#
class Region < ApplicationRecord
  belongs_to :prefecture, optional: false

  delegate :name, to: :prefecture, prefix: true

  with_options presence: true do
    validates :name
    validates :prefecture
  end
end
