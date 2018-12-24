module Entities
  class Survey < Grape::Entity
    expose :id
    expose :name
    expose :questions
  end
end