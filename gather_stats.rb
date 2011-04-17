#!/usr/bin/ruby

require 'ping'

class TargetServer
	attr_accessor :ip, :do_vmstat, :ssh_user

	def initialize(ip, vm = 1, ssh_user = "doug")
		@ip = ip
		@do_vmstat = vm	
		@ssh_user = ssh_user
	end

	def ping
		Ping.pingecho(@ip,5)
	end

	def vmstat
		if do_vmstat == 1 
			`ssh #{ssh_user}@#{ip} "vmstat 5 2 | tail -1"`
		else
			"this host is not configured for this command"
		end
	end

end

if __FILE__ == $0
	host = TargetServer.new("localhost",0,"doug")
	puts "ip = "+host.ip
	puts "result = "+host.ping.to_s
	puts "vmstat = "+host.vmstat.to_s
end

