class InvestorCategory < ApplicationRecord
	belongs_to :investor
	belongs_to :category
end
