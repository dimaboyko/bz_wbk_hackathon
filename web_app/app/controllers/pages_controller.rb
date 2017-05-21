class PagesController < ApplicationController
  def main
    ActionCable.server.broadcast 'documents', message: 'ok'
  end
end
