# extend ::Concerns::Routerable
# usage: router.<PATH>

module Concerns
  module Routerable
    private

    def router
      Rails.application.routes.url_helpers
    end

    def infakt_host
      A9n.infakt_domain
    end
  end
end
