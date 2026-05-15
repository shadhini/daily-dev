# Via DBeaver

## Error:  DBviewer mysql connection Public Key Retrieval is not allowed

This error typically occurs when using `MySQL 8.0+` because the server uses `caching_sha2_password` authentication by default, which requires a secure connection or an explicit RSA key exchange.

### Quick Fix: Update Driver Properties
tell the DBeaver driver to allow the public key retrieval manually
1. Right-click your connection in the Database Navigator and select Edit Connection.
2. Navigate to the Driver properties tab.
3. Locate the following two properties and update their values:
   - `allowPublicKeyRetrieval`: Set to `TRUE`.
   - `useSSL`: Set to `FALSE` (if you are not using SSL).
4. Click OK and test the connection.


### Alternative Fixes
1. **Switch to SSL**: If security is required, go to the SSL tab in the connection settings and ensure `"Use SSL"` and `"Require SSL"` are checked.
2. **Change Authentication Plugin**: revert the database user to the older authentication method 
   ```sql
   ALTER USER 'your_username'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_password';
   FLUSH PRIVILEGES;
   ```
   Use code with caution. This removes the requirement for the public key retrieval altogether.
3. **Check Driver Version**: Ensure you are using the latest MySQL driver. In the Edit Connection window, click Edit Driver Settings and then Download/Update to ensure the JDBC driver is up to date.
