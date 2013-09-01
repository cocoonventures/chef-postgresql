#
# Cookbook Name:: postgresql
# Recipe:: pg_user
#


# setup users
node["postgresql"]["users"].each do |user|
  pg_user user["username"] do
    privileges :superuser => user["superuser"], :createdb => user["createdb"], :login => user["login"]
    if user["encrypted_password"]
    	encrypted_password user["encrypted_password"]
    elsif user["password"] 
    	password user["password"]
	end
  end
end
