class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title,
                        :price,
                        :frequency,
                        :customer_id,
                        :tea_id

  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :biweekly, :monthly, :bimonthly]
end
