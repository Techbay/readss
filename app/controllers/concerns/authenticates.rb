require 'openssl'

module Authenticates
  private
  def authenticate_zone(secret:, trans_id:, dev_id:, amt:, currency:, open_udid:, udid:, odin1:, mac_sha1:, custom_id:, result:)
    test_str = "" << trans_id.to_s << dev_id.to_s << amt.to_s << currency.to_s << secret.to_s << open_udid.to_s << udid.to_s << odin1.to_s << mac_sha1.to_s << custom_id.to_s
    test_result = OpenSSL::Digest.hexdigest("MD5", test_str)
    test_result  == result.to_s
  end
end
