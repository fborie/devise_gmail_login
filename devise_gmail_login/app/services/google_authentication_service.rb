
class GoogleAuthenticationService

	def authenticate(username,password)
   	  host = 'smtp.gmail.com'
      port = 587
      domain = 'miuandes.cl'
      begin
      	puts "1"
        smtp = check_if_credentials_match(username,password,domain,host,port)
      	return true 
      rescue
        if smtp
          begin
            stmp.finish
          rescue
          	return false
          end 
        end
        return false
      end 
	end


	private

	def create_smtp_connection(host,port)
		smtp_connection = Net::SMTP.new host,port
		puts "3"
        smtp_connection.enable_starttls
        puts "4"
        return smtp_connection
	end

	def check_if_credentials_match(username,password,domain,host,port)
		puts "2"
		smtp_connection = create_smtp_connection(host,port)
		puts "5"
		smtp_connection.start(domain,username,password, :login)
		puts "6"
		return smtp_connection
	end

end