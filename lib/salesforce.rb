require 'databasedotcom'

class SalesforceIntegrationService
  
  def initialize(params)
    @username = params[:username]
    @password = params[:password]
    @security_token = params[:security_token]
    @client_id = params[:client_id]
    @client_secret = params[:client_secret]
    @client = Databasedotcom::Client.new :client_id => @client_id, :client_secret => @client_secret
  end
  
  # sync a contact with Salesforce contact 
  def sync_contact (id, first_name, last_name, email, phone, job_title)
    params = {"FirstName" => first_name, 
        "LastName" => last_name, 
        "Email" => email, 
        "Phone" => phone, 
        "Title" => job_title,
        "OwnerId" => @client.user_id}
    
    
    if id != nil && @client.find("Contact", id)
      @client.update("Contact", id, params)
    else
      c = @client.create("Contact", params)
      c.save
    end
  end
  
  
  def search_contact_by_email (email)
    sf_contact_class = @client.materialize("Contact")
    return sf_contact_class.find_by_Email(email)
  end
  
  def search_contact_by_id(id) 
    return @client.find("Contact", id)
  end
  
  
  def delete_contact (id)
    return @client.delete("Contact", id)
  end
  
  
  attr_reader :username, :password, :security_token, :client_id, :client_secret

  def connect
    return @client.authenticate :username => @username, :password => (@password + @security_token)
  end
  
  
end