require "walletone/version"
require "walletone/signature"
require "helpers/walletone_helper"
require "generators/install_generator.rb"
require "configure/configuration.rb"

module Walletone
  class WalletOneEngine < Rails::Engine
  end
  ActionView::Base.send :include, WalletoneHelper
  # Your code goes here...
end
