=begin
 OpenTok Ruby Library
 http://www.tokbox.com/

 Copyright 2010 - 2011, TokBox, Inc.

 Last modified: 2011-02-17
=end

module OpenTok
  require 'rubygems'
  require 'net/http'
  require 'uri'
  require 'digest/md5'
  require 'cgi'
  #require 'pp' # just for debugging purposes

  Net::HTTP.version_1_2 # to make sure version 1.2 is used

  VERSION = "tbrb-v0.91.2011-02-17"
  API_URL = "https://staging.tokbox.com/hl"
  
  require 'monkey_patches'
  require 'open_tok/exception'
  require 'open_tok/open_tok_sdk'
  require 'open_tok/session'
  require 'open_tok/archive'
  require 'open_tok/archive_video_resource'
  require 'open_tok/archive_timeline_event'
  require 'open_tok/test_helpers'
end
