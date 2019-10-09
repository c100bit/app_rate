module API::V1
  class RateSerializer < ActiveModel::Serializer
    attributes :id, :title, :code, :current
  end
end
