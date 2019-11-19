# frozen_string_literal: true

require "email_inquire/validator/base"

module EmailInquire
  module Validator
    class CommonlyMistakenDomain < Base

      MISTAKES = {
        /google(?!mail)/ => "gmail.com",
        /windows.*\.com/ => "live.com",
        /hormail\.com/ => "hotmail.com",
        /hormail\.es/ => "hotmail.com",
        /hotmaii\.com/ => "hotmail.com",
        /hotmaii\.es/ => "hotmail.es",
        /hotmaio\.com/ => "hotmail.com",
        /hotmaio\.es/ => "hotmail.es",
        /hotnail\.com/ => "hotmail.com",
        /hotnail\.es/ => "hotmail.es",
        /hotmaill\.com/ => "hotmail.com",
        /hotmaill\.es/ => "hotmail.es",
        /hotmai\.com/ => "hotmail.com",
        /hotmai\.es/ => "hotmail.es",
        /hotmali\.com/ => "hotmail.com",
        /hotmali\.es/ => "hotmail.es",
        /homail\.com/ => "hotmail.com",
        /homail\.es/ => "hotmail.es",
        /ouptlook\.com/ => "outlook.com",
        /ouptlook\.es/ => "outlook.es",
        /iclaoud\.com/ => "icloud.com",
        /gamail\.com/ => "gmail.com",
        /jmail\.com/ => "gmail.com",
        /gmail\.es/ => "gmail.com",
        /gimail\.com/ => "gmail.com",
        /gomail\.com/ => "gmail.com",
        /gemail\.com/ => "gmail.com",
        /g.mail\.com/ => "gmail.com",
        /gamil\.com/ => "gmail.com",
        /gnail\.com/ => "gmail.com",
        /gmali\.com/ => "gmail.com",
      }.freeze

      def validate
        return response.valid! if MISTAKES.value?(domain)

        _mistake, reference =
          MISTAKES.find do |mistake, _reference|
            mistake =~ domain
          end

        response.hint!(domain: reference) if reference
      end

    end
  end
end
