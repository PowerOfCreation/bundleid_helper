require "bundleid_helper/version"

module BundleidHelper
  class Helper
    def get_bundleid
      ###check if gem CFPropertyList exist,if not,install it
      ###use use this gem to parse plist file
      begin
        require 'cfpropertylist'
      rescue LoadError
        `gem install CFPropertyList`
        require 'cfpropertylist'
      end

      ipa_name = ''
      if ARGV.empty?
        puts "Please specify the ipa name you want to get info from!"
        exit 1
      elsif (ARGV.length > 1)
        puts "You can only specify one parameter!"
        exit 1
      else
        ipa_name = ARGV[0]
      end
      
      if File.extname(ipa_name) == ".ipa"
        ###unzip plist file from ipa
        command = "unzip -jo #{ipa_name} \"Payload/*.app/Info.plist\" -d /tmp/xxxxxtemp"
      elsif File.extname(ipa_name) == ".app"
        command = "mkdir -p /tmp/xxxxxtemp && cp #{ipa_name}/Info.plist /tmp/xxxxxtemp/Info.plist"
      else
        puts "Unknown file ending. Please use .ipa or .app!"
        exit 1
      end
      
      `#{command}`
      
      plist = CFPropertyList::List.new(:file => "/tmp/xxxxxtemp/Info.plist")
      data = CFPropertyList.native_types(plist.value)
      ###get bundle id
      bundle_id = data['CFBundleIdentifier']
      ###remove temp directory: xxxxxtemp
      `rm -rf /tmp/xxxxxtemp`
      puts bundle_id
    end
  end
end
