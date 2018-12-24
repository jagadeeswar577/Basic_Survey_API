class Question < ApplicationRecord
  belongs_to :survey
  has_many :responses,:dependent => :destroy
  accepts_nested_attributes_for :responses, :reject_if => lambda { |a| a[:response].blank? }, :allow_destroy => true
end
