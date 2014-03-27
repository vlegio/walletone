Walletone.configure do |config|
  config.merchant_id = 123456789 #Your merchant id
  config.secret_key = 'Your secret key place here'
  config.hash_type = 'Select type of signature'
  config.wmi_culture_id = 'ru_RU' #default language
  config.wmi_ptenabled = ['WalletOneRUB', 'WalletOneUSD'] #Allowed payments type
  config.wmi_ptdisabled = ['MtsRUB', 'WalletOneZAR']
end
