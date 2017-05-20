class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :contract

  # statusy:
  # FRIEND_FOUND - dodano transakcje (bez widocznego zamówienia)
  # NEW - przypisano OrderItem do transakcji
  # PAYMENT_REQUESTED - wysłana do potwierdzenia
  # PAID - zaplacono
end
