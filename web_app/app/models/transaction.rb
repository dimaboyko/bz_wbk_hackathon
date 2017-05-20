class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :contract

  # statusy:
  # FRIEND_FOUND - dodano transakcje (bez widocznego zamówienia)
  # NEW - przypisano OrderItem do transakcji
  # PAID - zaplacono

  default_scope { order(id: :asc) }
end
