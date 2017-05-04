class Deputy < ApplicationRecord
  has_many :voting_rows

  def to_sh
    options = {}
    serialization = ActiveModelSerializers::SerializableResource.new(self, options)
    serialization.serializable_hash
  end

end
