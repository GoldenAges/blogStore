create database testDatabase

create user test@localhost

set password for test@localhost=password('password')

grant all privileges on testDatabase.* to test@localhost identified by 'password'

flush privileges
