# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  release    :string           not null
#  lyrics     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
end
