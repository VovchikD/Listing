class Listing < ApplicationRecord
  enum status: { pending: 0, rejected: 1, approved: 2 }
end
