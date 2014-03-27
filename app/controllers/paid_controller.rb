module Walletone
  
  class PaidController < ::ApplicationController
    
    def index
      if params[:WMI_SIGNATURE].present?
        signature = params[:WMI_SIGNATURE]
      else
        return print_answer("Retry", "No paramets WMI_SIGNATURE")
      end
      accepted_params = params
      accepted_params.delete(:action)
      accepted_params.delete(:controller)
      accepted_params.delete(:WMI_SIGNATURE)
      unless signature == Walletone::Signature.generate(accepted_params)
        return print_answer("Retry", "Wrong WMI_SIGNATURE")
      end
      walletone_paid = {
        :payment_amount => params[:WMI_PAYMENT_AMOUNT],
        :currency_code => params[:WMI_CURRENCY_ID],
        :payment_id => params[:WMI_PAYMENT_NO],
        :walletone_id => params[:WMI_ORDER_ID],
        :description => params[:WMI_DESCRIPTION],
        :expired_date => params[:WMI_EXPIRED_DATE]
      }
      record = Walletrecord.where(walletone_paid).first
      unless record.nil?
        record.update_attribute(:state, params[:WMI_ORDER_STATE])
        return print_answer("OK")
      else
        return print_answer("Retry", "Unknown order")
      end
    end

    private 
      def print_answer(status, description = '')
        answer = "WMI_RESULT=#{status}"
        if description.length > 0
          answer += "&WMI_DESCRIPTION=#{description}"
        end
        render text: answer
      end

  end

end
