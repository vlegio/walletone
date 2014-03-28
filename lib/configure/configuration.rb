module Walletone
  class <<self; end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given
  end

  class Configuration
    attr_accessor :wmi_ptenabled, :wmi_ptdisabled, :wmi_currency_id, :wmi_fail_url,
                  :wmi_merchant_id, :wmi_culture_id, :secret_key, :hash_type,
                  :wmi_expired_in
    def initialize
      @wmi_ptenabled = ['WalletOneRUB', 'WalletOneUAH', 'WalletOneUSD', 'WalletOneZAR', 'WalletOneBYR', 'WalletOneTJS']
      @wmi_ptdisabled = ['MtsRUB']
      @wmi_merchant_id = 12345678
      @wmi_culture_id = 'ru-RU'
      @wmi_currency_id = 643
      @wmi_fail_url = 'http://google.ru'
      @wmi_expired_in = 5.hours
      @secret_key = 'secret_key'
      @hash_type = 'md5' #or sha-1
    end
  end
end
