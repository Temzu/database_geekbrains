use geodata;
create user 'new_user'@'%' identified with mysql_native_password by '12345';
grant all privileges on geodata to 'new_user'@'%';