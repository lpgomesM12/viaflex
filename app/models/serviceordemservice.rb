class Serviceordemservice < ActiveRecord::Base
  belongs_to :serviceordem
  belongs_to :service
end
