---
title: Java
render_with_liquid: false
---

# Java

---
`General-purpose programming language` 

#### My Notes
---

## Ecosystem, Frameworks & Tooling

## Core Concepts

## Key Features & Strengths

## Architectural Considerations

## Common Use Cases

## When is Java a Good Fit

## Limitations & When Not to Use

## Emerging Trends

## TODO:
- [ ] To be refined & verified


--- unverified --------------------------------------------------------------
## Ecosystem, Frameworks & Tooling

- **Build Tools:**
  - **`Maven`**: Dependency management, project lifecycle
  - **`Gradle`**: Flexible, Groovy/Kotlin-based build automation
  - **`Ant`**: Older, XML-based build tool
- **Web Frameworks:**
  - **`Spring Framework` (`Spring Boot`)**: Enterprise applications, microservices
  - **`Jakarta EE`** (formerly **`Java EE`**): Enterprise standards -- `JPA`, `Servlets`, `JSF`, `EJB`
  - **`Quarkus`, `Micronaut`**: Cloud-native, serverless optimized
- **`ORM`: Object-Relational Mapping**
  - **`Hibernate`**: Popular JPA
  - **`MyBatis`**: SQL-centric persistence framework
- **Testing Frameworks:**
  - **`JUnit`**: De-facto standard for unit testing
  - **`Mockito`**: Mocking framework
  - **`TestNG`**: Advanced testing framework
- **Dependency Injection:**
  - **`Spring DI`**: Core of Spring Framework
  - **`Jakarta CDI`**: Contexts and Dependency Injection
- **Cloud & Containerization:**
  - Strong cloud provider support -- `AWS`, `Azure`, `GCP`
  - Containerization support -- `Docker`, `Kubernetes`
  - JAR/WAR Packaging
  - Cloud Native: `GraalVM`, `Spring Cloud`
- **Deployment:**
  - Traditional: Application servers -- `Tomcat`, `Jetty`, `WildFly`, `GlassFish`
  - Modern: Fat JARs, Serverless -- AWS Lambda w/ Java
- **Paradigms:**
  - Reactive Programming: `Project Reactor`, `RxJava`
  - Functional Programming: Java 8+ features -- `Streams`, `Lambdas`
  - Aspect-Oriented Programming (AOP): `Spring AOP`, `AspectJ`
  - Microservices: `Spring Cloud`, `Helidon`, `Micronaut`
  - Serverless: `AWS Lambda`, `Azure Functions`, `Google Cloud Functions`
  - Event-Driven Architecture: `Kafka`, `RabbitMQ`, `ActiveMQ`
  - OOP
- **`GraphQL`**: 
  - `Spring GraphQL`, `GraphQL Java`
- **`API Management`**: 
  - `Spring Cloud Gateway`, `Kong`, `Apigee`
- **`Data Processing`**: 
  - `Apache Spark`, `Apache Flink`, `Apache Beam`
- **`Big Data`**: 
  - `Hadoop`, `Apache Cassandra`, `Elasticsearch`
- **`Machine Learning`**: 
  - `Deeplearning4j`, `Weka`, `Apache Mahout`
- **`Blockchain`**: 
  - `Web3j`, `Hyperledger Fabric SDK for Java`
- **`IoT`**: 
  - `Eclipse IoT`, `Kura`, `Thingsboard`
- **`Game Development`**: 
  - `LibGDX`, `jMonkeyEngine`
- **`Desktop Applications`**: 
  - `JavaFX`, `Swing`
- **`Embedded Systems`**: 
  - `Java ME`, `OpenJDK for Embedded`
- **`Scripting & Automation`**: 
  - `Groovy`, `Jython`, `JRuby`
- **`API Development`**: 
  - `Spring MVC`, `JAX-RS`, `GraphQL`
  - API documentation - `Swagger/OpenAPI` 
  - API testing - `Spring Cloud Contract` 
  - API gateway functionality - `Spring Cloud Gateway` 
  - API security - `Spring Security` 
  - monitoring and management - `Spring Boot Actuator`  
  - development convenience - `Spring Boot DevTools`
  

## Core Concepts

- **`JVM`: Java Virtual Machine**
  - `"Write Once, Run Anywhere"`: platform-independent 
    - bytecode runs on JVM across OSes
  - Memory management: `garbage collection`
  - Runtime services
  - Security Sandbox
- **`JRE`: Java Runtime Environment**
  - `JVM` + Core libraries (for running apps) 
- **`JDK`: Java Development Kit**
  - `JRE` + Dev Tools (`compiler`, `debugger`)
- **`OOP`: Object-Oriented Programming**
  - Encapsulation, Inheritance, Polymorphism, Abstraction
  - Classes & Objects 
- **`Strongly Typed`**
  - strict type rules
    - operations between incompatible types -> generally disallowed
    - less likely to perform automatic unexpected type conversions that could lead to errors
- **`Statically Typed`**
  - Compile-time type checking
- **`GC`: Garbage Collection**
  - Automatic memory management --> Reduce memory leaks
  - GC tuning for performance-critical applications

## Key Components
### Java Virtual Machine (JVM)
- **Role:** Abstract execution, garbage collection, security sandbox
- **Tuning:** Heap size, GC algorithms, JIT compilation

### Java Standard Edition (SE)
- **Core APIs:** `java.lang`, `java.util`, `java.io`, `java.net`, `java.time`, `java.sql`
- **Concurrency:** `java.util.concurrent` package

### Java Enterprise Edition (Jakarta EE)
- **Web:** `Servlets`, `JSP`, `JSF`
- **Business:** `EJB`, `JPA`, `CDI`
- **Integration:** `JMS`, `JAX-RS`, `JAX-WS`


## Key Features & Strengths

- **Platform Independence:**
  - Runs on any OS with a compatible JVM
- **Robustness & Reliability:**
  - Exception handling
  - Strong memory model
- **Performance:**
  - `JIT`: Just-In-Time compilation --> optimize code at runtime
  - Optimized JVMs.
- **Multithreading & Concurrency:**
  - Built-in support --> `java.util.concurrent` package
  - Threads, Executors, Locks, Synchronizers, Fork/Join framework, `CompletableFuture`
- **Security:**
  - Security Manager
  - Bytecode verification
  - Sandboxing
- **`Java API`: Extensive Standard Library:**
  - Rich pre-built classes 
    - I/O | networking | collections | ...
- **Backward Compatibility:**
  - Generally good
  - Major versions need care
- **Large, Mature Ecosystem:** 
  - Vast libraries, frameworks, tools.
- **Strong Community Support:** 
  - Extensive documentation, forums

## Architectural Considerations

- **Modularity:**
  - `JPMS`: Java Platform Module System (JPMS - Project Jigsaw | Java 9+)
    - Encapsulation -- internal APIs
    - Dependency management
  - `OSGi` (older, specific contexts)
- **Scalability & Performance:**
  - `JVM tuning` -- heap size, GC algorithms, JVM flags, HotSpot optimizations
  - Concurrency models: 
    - Threads, `CompletableFuture`, Fork/Join, Executors
  - Asynchronous programming
    - `CompletableFuture`
    - Project Loom - `Virtual Threads`
  - Profiling: `VisualVM`, `JProfiler`, `Flight Recorder`
- **Maintainability:**
  - Design patterns: Singleton, Factory, Observer, Builder, ...
  - SOLID principles
  - Leveraging strong typing
  - Clear API design
  - Layered architecture
    - Presentation, Service, Repository, Domain layers
- **Interoperability:** communication with other languages and systems
  - `JNI`: native code integration (C/C++)
  - `GraalVM`
  - Standard protocols -- `REST`, `SOAP`, `gRPC`
  - Microservices: `Spring Cloud`, `Quarkus`, `Micronaut`
  - Polyglot: `Kotlin`, `Scala`, `Groovy`, `Clojure on JVM`
- **Evolution & LTS (Long-Term Support):**
  - Regular releases
  - LTS for enterprise stability
  - Be mindful of -- migration paths, deprecations
- **Security Best Practices:**
  - Input validation
  - Secure coding practices
  - Dependency vulnerability scanning
  - Java's security features
  - Code signing
  - Permissions
  - Secure Classloading
  - Sandboxing: Java Security Manager [deprecated in Java 17, removed in Java 21]
  - Vulnerabilities: Serialization, Reflection, Deserialization attacks
- **Observability:**
  - Logging frameworks -- `SLF4j`, `Logback`, `Log4j`, `java.util.logging`
  - Metrics -- `Micrometer`
  - Tracing -- `OpenTelemetry`


## Common Use Cases

- **Enterprise Applications:** Large-scale, complex systems
- **Web Applications:** Backend services, APIs
- **Android Mobile Development:** Native language for Android
- **Big Data Technologies:** Hadoop, Spark, Kafka are often Java-based
- **Microservices:** Spring Boot, Quarkus, Micronaut facilitate microservice architectures
- **Financial Services:** High-performance trading platforms, banking systems
- **Scientific Applications:** Computationally intensive tasks
- **Embedded Systems:** `Java ME`, specific JVMs 


## When is Java a Good Fit

- **Large, Complex Enterprise Systems:** Stability, scalability, maintainability
- **High-Performance Backend Services:** Mature JVM, concurrency features
- **Cross-Platform Applications:** "Write Once, Run Anywhere" requirement
- **Projects Requiring Strong Concurrency:** Robust threading model
- **Ecosystem Leverage:** Need for extensive libraries, frameworks, and tooling
- **Teams with Existing Java Expertise:** Large talent pool
- **Long-Term Support (LTS) Needs:** Critical for enterprise stability
- **Android App Development:** Primary language

## Limitations & When Not to Use

- **Resource-Constrained Environments (Traditionally):**
  - JVM overhead (memory, startup time). (GraalVM Native Images mitigate this)
- **Rapid Prototyping (for some):**
  - Verbosity compared to scripting languages (Python, Ruby)
- **Simple Scripts or Small Utilities:**
  - Can be overkill; lighter languages might be faster to develop
- **Desktop GUIs (Less Common Now):**
  - Swing/JavaFX exist but less popular than web or native alternatives for new projects
- **Performance-Critical Low-Level System Programming:**
  - C/C++ might offer more direct hardware control
- **Projects Where Startup Time is Absolutely Paramount (without AOT):**
  - Traditional JVM startup can be slower than compiled native code


## Emerging Trends

- **`GraalVM`:** 
  - High-performance JDK
  - Native image compilation: `AOT` Ahead-Of-Time compilation 
     - faster startup  
     - lower memory footprint
- **`Project Loom - Virtual Threads`:** 
  - Lightweight concurrency model (Java 21+)
- **Reactive Programming:** `Spring WebFlux`, `Project Reactor` 
- **Serverless & Cloud-Native Optimizations:** quick startup, low resource consumption
- **AI/ML Integration:** e.g: `Deeplearning4j` 

- **Modern Java**:
  - Lambdas & Streams (Java 8+) -- functional programming, declarative data processing
  - Modules -- `JPMS` - Java 9+
  - Records, Sealed Classes, Pattern Matching (Java 14+)