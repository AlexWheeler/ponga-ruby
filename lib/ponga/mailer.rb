module Ponga
  class Mailer
    attr_reader :api_key
    API_ENDPOINT = "https://www.getponga.com/messages".freeze

    def initialize(api_key)
      @api_key = api_key
    end

    def send(subject:, body:, to:)
      HTTParty.post(API_ENDPOINT, body: {
        message: {
          subject: subject,
          recipient: to,
          body: body
        },
        key: api_key
      })
    end
  end
end
