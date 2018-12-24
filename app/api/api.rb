
class API < Grape::API # :nodoc:
  version 'v1', using: :path
  format :json
  prefix :api

  rescue_from ActiveRecord::RecordNotFound do |e|
    error!('Record not found', 404)
  end

  rescue_from ActiveRecord::RecordNotUnique do |e|
    error!('Record not unique', 422)
  end

  rescue_from ActiveRecord::ActiveRecordError do |e|
    error!(e.message, 422)
  end


  mount SurveysAPI

end

