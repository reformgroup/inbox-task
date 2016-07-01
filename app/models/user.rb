class User < ApplicationRecord
  include Userstampable::Stampable
  include Userstampable::Stamper
end
