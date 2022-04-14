![HFSQL](https://www.pcsoft.fr/img/visuels/19/hfsql.png)

# HFSQL : UNLIMITED DATABASE


HFSQL is a database engine included in the development environments (WINDEV, WINDEV Mobile and WEBDEV). 

HFSQL is very **powerful**, **fast** and **reliable**.  
HFSQL has already been deployed on millions of sites worldwide. 

# Environment Variables

If you start the HFSQL container without an existing database, you must use one of the following variables
- HFSQL_PASSWORD: Password of the initial account.
- HFSQL_PASSWORD_FILE: Path of the file that contains the password of the initial account.
- HFSQL_RANDOM_PASSWORD: if this variable is a non-empty value (like yes), the password for the initial account is generated randomly and displayed on the standard output.  
This password can be found in the logs with the command:
    > docker logs \<container name\>
- HFSQL_ALLOW_EMPTY_PASSWORD: if this variable is a non-empty value (like yes) then there is no password and the HFSQL server is not password protected. This configuration is not recommended unless the container is not network accessble.

You can also use the HFSQL_USER optional variable to set the name of the account (admin by default.)  

# More info: 

- [Description](http://www.windev.com/pcsoft/hfsql.htm)
- [Usage](https://doc.windev.com/?1000017421)
