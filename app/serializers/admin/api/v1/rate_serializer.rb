module ADMIN::API::V1
  class RateSerializer < ActiveModel::Serializer
    attributes :id, :title, :code, :current
    has_many :histories
  end
end
