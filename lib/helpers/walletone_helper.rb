module WalletoneHelper
 
  def paid_form(price, payment_no, success_url, description = '')
    form_params = {
      :WMI_MERCHANT_ID => Walletone.configuration.wmi_merchant_id,
      :WMI_PAYMENT_AMOUNT => price,
      :WMI_CURRENCY_ID => Walletone.configuration.wmi_currency_id,
      :WMI_PAYMENT_NO => payment_no,
      :WMI_DESCRIPTION => "BASE64:#{Base64.encode64(description).to_s}",
      :WMI_SUCCESS_URL => success_url,
      :WMI_FAIL_URL => Walletone.configuration.wmi_fail_url,
      :WMI_EXPIRED_DATE => (Time.now.utc + Walletone.configuration.wmi_expired_in).strftime('%Y-%m-%dT%H:%M:%S'),
      :WMI_CULTURE_ID => Walletone.configuration.wmi_culture_id
    }
    if Walletone.configuration.wmi_ptenabled.present?
      form_params[:WMI_PTENABLED] = Walletone.configuration.wmi_ptenabled
    end
    if Walletone.configuration.wmi_ptdisabled.present?
      form_params[:WMI_PTDISABLED] = Walletone.configuration.wmi_ptdisabled
    end

    form_params[:WMI_SIGNATURE] =  Walletone::Signature.generate(form_params)

    walletone_paid = {
        :payment_amount => form_params[:WMI_PAYMENT_AMOUNT],
        :currency_code => form_params[:WMI_CURRENCY_ID],
        :payment_id => form_params[:WMI_PAYMENT_NO],
        :description => form_params[:WMI_DESCRIPTION],
        :expired_date => form_params[:WMI_EXPIRED_DATE],
        :walletone_id => 0,
        :state => 'not_paid'
      }
    Walletrecord.create(walletone_paid)

    #▼▼▼▼▼▼▼Generate form here▼▼▼▼▼▼▼

  end


end 
