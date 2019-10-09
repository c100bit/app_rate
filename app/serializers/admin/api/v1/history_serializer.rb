module ADMIN::API::V1
  class HistorySerializer < ActiveModel::Serializer
    attributes :created_at, :sum, :force_date, :id
  end
end
