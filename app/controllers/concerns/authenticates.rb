require 'openssl'

module Authenticates
  def authenticate_zone(secret:, trans_id:, dev_id:, amt:, currency:, open_udid:, udid:, odin1:, mac_sha1:, result:)
    test_str = "" << trans_id << dev_id << amt << currency << secret << open_udid << udid << odin1 << mac_sha1
    test_result = OpenSSL::Digest.hexdigest("MD5", test_str)
    test_result  == result
  end
end
