class hosts {
	# This call will collect host info and exported to Master

	@@host { $::hostname:
	 ip =>  $::ipaddress,
	 host_aliases => $::fqdn,
	}
	Host <<||>>


	resources {
	    'host':
	        purge  => true,
	        
	}
}