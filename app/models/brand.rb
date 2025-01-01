class Brand
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nameEn, type: String
  field :active, type: Mongoid::Boolean

  validates_uniqueness_of :nameEn
end

