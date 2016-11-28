class Productordem < ActiveRecord::Base
  belongs_to :serviceordem
  belongs_to :product
end
