# == Schema Information
#
# Table name: config_parameters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  value      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ConfigParameter < ActiveRecord::Base
  attr_accessible :name, :value
end
