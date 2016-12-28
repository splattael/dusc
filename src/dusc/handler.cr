module Dusc
  module Handler
    def self.call(token, domain)
      return false unless valid_token?(token)
    end

    def self.valid_token?(token)
      true
    end
  end
end

