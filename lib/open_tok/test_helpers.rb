require "net/http"
require "rexml/document"

module OpenTok
  module TestHelpers

    def session_exists?(session_id, api_url = 'https://staging.tokbox.com/hl')
      url = URI.parse api_url + '/session/' + session_id
      http = Net::HTTP.new url.host, url.port
      if url.scheme == 'https'
          http.use_ssl = true
      end
      res = http.post url.path, ''

      return res.code == "200"
    end

    def token_is_valid?(token, api_url = 'https://staging.tokbox.com/hl')
      begin
        xml = get_token_info token, api_url
        return xml.root.elements['token/invalid'] == nil
      rescue
        return true
      end
    end

    def token_has_role?(token, role, api_url = 'https://staging.tokbox.com/hl')
      begin
        xml = get_token_info token, api_url
        returned_role = xml.root.elements['token/role'].children[0].to_s
        returned_role.strip!
        return returned_role == role
      rescue
        return false
      end
    end

    def token_has_connection_data?(token, data, api_url = 'https://staging.tokbox.com/hl')
      begin
        xml = get_token_info token, api_url
        returned_data = xml.root.elements['token/connection_data'].children[0].to_s
        return returned_data == data
      rescue
        return false
      end
    end

    def token_has_expiration_time?(token, expire_time, api_url = 'https://staging.tokbox.com/hl')
      begin
        xml = get_token_info token, api_url
        returned_expire_time = xml.root.elements['token/expire_time'].children[0].to_s
        return returned_expire_time == expire_time.to_s
      rescue
        return false
      end
    end

    private
    def get_token_info(token, api_url)
      url = URI.parse api_url + '/token/validate'
      http = Net::HTTP.new url.host, url.port
      if url.scheme == 'https'
          http.use_ssl = true
      end
      headers = { 'X-TB-TOKEN-AUTH' => token }    
      res = http.request_post url.path, '', headers
      return REXML::Document.new res.read_body
    end

  end
end
