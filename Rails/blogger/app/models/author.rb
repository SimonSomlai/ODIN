class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message:"Should Match Confirmation", if: :password
end
