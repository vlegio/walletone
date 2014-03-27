require 'digest/md5'
require 'digest/sha1'
require 'base64'
module Walletone

  module Signature

    class <<self; end

    def self.generate(obj_hash)
      string = ''
      obj_hash.sort.each do |obj|
        if obj[1].instance_of? Array
          arr = obj[1].sort
          string += arr.join
        else
          string += obj[1].to_s
        end
      end
      result = ''
      case Walletone.configuration.hash_type
      when 'md5'
        result = Base64.encode64(Digest::MD5.digest(string)).to_s
      when 'sha-1'
        result = Base64.encode64(Digest::SHA1.digest(string)).to_s
      end
      return result
    end

  end

end
