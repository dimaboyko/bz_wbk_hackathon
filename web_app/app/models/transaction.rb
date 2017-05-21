class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :contract

  # statusy:
  # FRIEND_FOUND - dodano transakcje (bez widocznego zamówienia)
  # NEW - przypisano OrderItem do transakcji
  # PAYMENT_REQUESTED - wysłana do potwierdzenia
  # PAID - zaplacono

  default_scope { order(id: :asc) }
  scope :only_friend_founds, -> { where(status: 'FRIEND_FOUND') }
end
