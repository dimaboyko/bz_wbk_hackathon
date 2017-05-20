# extend ::Concerns::Performable
# usage: klass.perform(*)

module Concerns
  module Performable
    def perform(*args)
      new(*args).send(performable_method)
    end

    def performable_method(method_name = nil)
      @method_name = method_name if method_name
      @method_name || :perform
    end
  end
end
