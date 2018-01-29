rds_db_instance = search("aws_opsworks_rds_db_instance").first

file '/srv/conn.json' do
  content "{\"user\":\"#{rds_db_instance['db_user']}\",\"password\":\"#{rds_db_instance['db_password']}\", \"address\":\"#{rds_db_instance['address']}\", \"port\":\"#{rds_db_instance['port']}\"}"
end
