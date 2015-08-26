# ActiveSupport added because an issue with CircleCI dependency order
require 'active_support'
require 'active_support/core_ext'


require 'test/unit'
require 'salesforce'

class SalesforceTest < Test::Unit::TestCase
  
  def setup
    connection_params = { username: "rossato.rd.test01@gmail.com", password: "aa19pp00", security_token: "8b2eeJV8IZFdYEyfyITUPbnwq",
      client_id: "3MVG9KI2HHAq33Rwg9663_PmQLlWr0BBw0P78QjWl83gpYzrVnSIVUXfPY4fggUHzwbrI4bH6udQt08uIB4gz", client_secret: "7237465971482046021" }
    
    @salesforce = SalesforceIntegrationService.new(connection_params)
    @salesforce.connect()
  end
  
  def test_01_create_contact
     contact = @salesforce.sync_contact(nil, "Test", "Test", "test@test.com", "+1-800-TEST", "Test")
     assert_not_nil(contact)
  end
  
  def test_02_find_by_email
    contact = @salesforce.search_contact_by_email("test@test.com")
    assert_not_nil(contact)
  end
  
  def test_03_delete_contact
    contact = @salesforce.search_contact_by_email("test@test.com")
    contact.delete()
    
    # we don't expect to find the contact, so an error is raised by Databasedotcom
    assert_raise Databasedotcom::SalesForceError do
      @salesforce.search_contact_by_id(contact.Id)
    end
  end

end