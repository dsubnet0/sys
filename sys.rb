#!/usr/bin/ruby

require 'ping'

class Host
	attr_accessor :name, :ip

	def initialize(name, ip = "localhost")
		@name = name
		@ip = ip
	end

	def ping
		Ping::ICMP.new(@ip)
	end
end

if __FILE__ == $0
	myhost = new Host('dougs',localhost)
	puts "ip = "+myhost.ip
	puts "ping = "+mysql.ping.to_s
end

