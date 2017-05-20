# include ::Concerns::Transactionable
# usage:  in_transaction { lubudubu }

module Concerns
  module Transactionable
    def in_transaction(&block)
      ActiveRecord::Base.transaction(&block)
    end
  end
end
