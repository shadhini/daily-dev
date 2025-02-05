# Apache Synapse ESB

[Apache Synapse documentation](http://synapse.apache.org/)

`an open-source Enterprise Service Bus (ESB)` | `mediation framework` 
* facilitates communication between different applications in a `SOA` (service-oriented architecture). 
* lightweight and flexible platform for integrating and managing various services enabling 
  * interoperability and 
  * seamless data exchange

### Use Cases

- Service Integration
- Message Transformation
- Routing and Load Balancing

### Key Features of Apache Synapse ESB

1. **Message Mediation:**
    - message formats supported: `SOAP`, `REST`, `JSON`, `XML`
    - message transformation
    - message routing
    - message filtering

2. **Service Orchestration:**
    - aggregates multiple web services into a single service
    - complex workflows  
    - service chaining

3. **Protocol and Data Transformation:**
    - messages transformation between: `HTTP`, `JMS`, `SMTP` ...
    - data formats conversion

4. **Security:**
    - `SSL/TLS` | `WS-Security` | `OAuth`
    - authentication | authorization | encryption

5. **Scalability and Performance:**
    - high performance design 
    - can handle a large number of concurrent messages
    - clustering
    - load balancing 

6. **Extensibility:**
    - custom mediators and connectors
    - integration with other Apache projects like `Apache Axis2` and `Apache CXF`.

### Example Configuration

Example of an Apache Synapse configuration that routes messages based on their content:

```xml
<definitions xmlns="http://ws.apache.org/ns/synapse">
    <proxy name="SimpleStockQuoteProxy" transports="http">
        <target>
            <inSequence>
                <log level="full"/>
                <filter source="$body/stockSymbol" regex="IBM">
                    <send>
                        <endpoint>
                            <address uri="http://example.com/IBMStockQuoteService"/>
                        </endpoint>
                    </send>
                </filter>
                <filter source="$body/stockSymbol" regex="GOOG">
                    <send>
                        <endpoint>
                            <address uri="http://example.com/GoogleStockQuoteService"/>
                        </endpoint>
                    </send>
                </filter>
            </inSequence>
            <outSequence>
                <send/>
            </outSequence>
        </target>
    </proxy>
</definitions>
```

- **Proxy Service:** Defines a proxy named `SimpleStockQuoteProxy` that listens for HTTP requests.
- **In Sequence:** Logs incoming messages and uses filters to route messages based on the `stockSymbol` element in the message body.
    - If the `stockSymbol` is "IBM", the message is sent to the IBM Stock Quote Service.
    - If the `stockSymbol` is "GOOG", the message is sent to the Google Stock Quote Service.
- **Out Sequence:** Forwards the response back to the client.



