class PagesController < ApplicationController
  def main
    ActionCable.server.broadcast 'documents', message: {fo: :bar}
  end
end
