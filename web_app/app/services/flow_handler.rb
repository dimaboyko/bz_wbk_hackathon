class FlowHandler

  class << self
    def reset!
      # KROK 00
      # kasujemy wszystko
      User.delete_all
      Contract.delete_all
      Order.delete_all
      OrderItem.delete_all
      Transaction.delete_all

      # KROK 01 http://50cwvb.axshare.com/#g=1&p=01-pusta-lista_1
      # Tworzymy ownera kontraktu - restauracje oraz klienta kontraktu (osobę zalogowaną) - Dimę
      owner = User.create(name: 'Restauracja', available_amount: 1000)
      dima = User.create(name: 'Dima', available_amount: 500)

      # 02/03 http://50cwvb.axshare.com/#g=1&p=02-powstal-kontrakt-niepotwierdzony_1
      # Dima prosi Alexę o rachunek, tworzony jest order & kontrakt z restauracją
      Contracts::Creator.perform(dima)

      #04 dzielenie http://50cwvb.axshare.com/#g=1&p=04-kontrakt-dzielenie_1
      # Dima prosi Alexę o dzielenie rachunku, pod obecnym widokiem (03) dodany zostaje Transaction na 0 Dimy (na 0 ze względu na status FriendFound)
      contract = Contract.last #todo!!!
      dima = User.find_by_name('Dima')
      item_dima = OrderItem.find_by_name('Hamburger')
      dima.transactions.create(contract_id: contract.id, amount: item_dima.amount, status: 'FRIEND_FOUND')

      # 05 http://50cwvb.axshare.com/#g=1&p=05-dodanie-ludzi
      # Alexa znalazła trzech przyjaciół Dimy przy stole, wyświetlamy popup

      #dodanie ludzi jako |Friend Found| - czyli pokazujemy same imiona, bez kwot, mimo że będą one w bazie - popup
      contract = Contract.last #todo!!!
      Transactions::Creator.perform(contract)
      # na widoku wyświetl popup transactions ze statusem FRIEND_FOUND

      # 06  - lista http://50cwvb.axshare.com/#g=1&p=06-ludzie-dodani
      # zostaje wybrana opcja "Wybierz wszystkich"
      # tylko zmiana w widokach
      # wyświetl listę transactions ze statusem FRIEND_FOUND

      # 07 http://50cwvb.axshare.com/#g=1&p=07-przydzielanie
      # Dima mówi po kolei alexy kto co zamówił, w odpowiedzi kwoty i produkt pojawiają się przy danej osobie

      #iteracja dla każdego przyjaciela
      #transaction_id => status zmieniony z :friend_found na :new
      #iteracje kończą się widokiem 08 (gdy przypiszemy wszystkie produkty)

      #09 http://50cwvb.axshare.com/#g=1&p=09-wyslane
      # każdy na "mobilnej wersji" potwierdza swoja transakcję
      # iteracje zmieniające status z :new na :paid dla każdego kliku

      #iteracje koncza  sie 10, gdy wszyscy opłacą


      # 11 akcja opłacenia kontraktu http://50cwvb.axshare.com/#g=1&p=11-zaplacono
      # kończy się zmianą statusu kontraktu
      puts "Done!"

    end
  end

end