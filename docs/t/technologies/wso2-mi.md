# WSO2 Micro Integrator 

[WSO2 Micro Integrator documentation](https://mi.docs.wso2.com/en/latest/).

`lightweight and container-friendly integration runtime designed for microservices architectures`

* part of the WSO2 Enterprise Integrator suite 
* a robust platform for building, deploying, and managing integration solutions in cloud-native environments

### Use Cases

- Service Integration
- API Management
- Data Transformation
- Event-Driven Architecture


### Key Features of WSO2 Micro Integrator

1. **Lightweight and Container-Friendly:**
    - optimized for deployment in `Docker`, `Kubernetes`, and other containerized environments
    - small footprint --> suitable for microservices architectures

2. **Comprehensive Mediation Capabilities:**
    - message routing
    - message transformation
    - message enhancement
    - wide range of built-in mediators for various integration tasks

3. **Supports Multiple Integration Patterns:**
    - facilitates various `EIPs` (enterprise integration patterns)  
         - content-based routing
         - message transformation 
         - service orchestration
    - can be used to implement complex integration scenarios

4. **Seamless Connectivity:**
    - wide range of protocols and data formats  
      -  `HTTP`, `HTTPS`, `JMS`, `SOAP`, `REST`, `JSON`, `XML`
    - connectors for various third-party systems and cloud services

5. **High Availability and Scalability:**
    - support high availability through **clustering** and **failover mechanisms**
    - scalable to handle varying loads and large volumes of data

6. **DevOps Friendly:**
    - integrates well with CI/CD pipelines for automated deployment and testing
    - monitoring and management capabilities 
      - via tools like `Prometheus` and `Grafana`

### Example Configuration

Example of a WSO2 Micro Integrator configuration that routes messages based on the content of the message:

```xml
<definitions xmlns="http://ws.apache.org/ns/synapse">
    <sequence name="main">
        <log level="full">
            <property name="Message" value="Routing based on content"/>
        </log>
        <filter source="$body/stockSymbol" regex="WSO2">
            <then>
                <send>
                    <endpoint>
                        <address uri="http://example.com/WSO2StockQuoteService"/>
                    </endpoint>
                </send>
            </then>
            <else>
                <send>
                    <endpoint>
                        <address uri="http://example.com/DefaultStockQuoteService"/>
                    </endpoint>
                </send>
            </else>
        </filter>
    </sequence>
</definitions>
```

- **Sequence:** Defines a sequence named `main` that will handle incoming messages.
- **Logging:** Logs the message with a custom property to indicate that routing is based on content.
- **Filter:** Uses a filter mediator to check the `stockSymbol` element in the message body.
    - If the `stockSymbol` is "WSO2", the message is routed to the WSO2 Stock Quote Service.
    - If the `stockSymbol` is not "WSO2", the message is routed to the Default Stock Quote Service.


