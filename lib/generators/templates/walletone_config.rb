Walletone.configure do |config|
  config.merchant_id = 123456789 #Your merchant id
  config.secret_key = 'Your secret key place here'
  config.hash_type = 'Select type of signature'
  config.wmi_culture_id = 'ru_RU' #default language
  config.wmi_ptenabled = ['WalletOneRUB', 'WalletOneUSD'] #Allowed payments type
  config.wmi_ptdisabled = ['MtsRUB', 'WalletOneZAR'] #Disalowed payments type
  config.wmi_currency_id = 643 #Currency id
  config.wmi_fail_url = 'http://foofle.com' #Redirect to this in fail
  config.wmi_expired_in = 5.hours #Expired order time
end
