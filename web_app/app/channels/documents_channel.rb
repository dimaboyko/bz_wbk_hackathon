  class DocumentsChannel < ::ApplicationCable::Channel

    def subscribed
      stream_from 'documents'
    end

  end
