### CRLF_INJECTION_LOGS
`Carriage Return Line Feed`

#### Issue

CRLF injection in logs is a security vulnerability that can allow attackers to manipulate log files, potentially injecting malicious content or misleading log entries.

#### Solution
```
sanitize any user input or external data before logging it
```


##### Identifying Log Injections Points

* Check points where user input or external data is being logged; 
  * even if it is detected as user input/external data, 
    * check whether it's really possible for an external party to manipulate it.
    * If it's not possible, then it's not a vulnerability.

```java
logger.info("User input: " + userInput);
```

##### Sanitizing the Input

* Ensure that (CRLF) newline characters (`\r `and `\n`) are properly escaped or removed from the log entries.

```java
public class LogSanitizer {

    public static String sanitize(String input) {
        if (input == null) {
            return null;
        }
        
        // Replace CR and LF characters with empty strings or escape sequences
        // Option 1:
        // return input.replace("\r", "\\r").replace("\n", "\\n");
        // Option 2:
        return input.replaceAll("[\r\n]", "");
        return input.replace("\r", "\\r").replace("\n", "\\n");
    }
}
```
```java
logger.info("User input: " + LogSanitizer.sanitize(userInput));
```




