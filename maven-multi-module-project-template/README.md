# Maven Multi Module Project Template

## Items included

### 1. root pom
* POM model version 
* group id, artifact id, version, packaging and description of the project (root artifact)
* how to include modules
  
```xml
<project>
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.example</groupId>
    <artifactId>example</artifactId>
    <version>1.0.0</version>
    <packaging>pom</packaging>
    <description>Example Project</description>

    <modules>
        <!-- sub modules should be listed here with path to each module -->
        <module>module1</module>
    </modules>
</project>
```

#### Build
build configurations for the project 

```xml
<project>
    ....
    <build>
        <pluginManagement> 
         <!-- used to centrally manage plugin versions and configurations that can be inherited by child modules 
                 without applying the plugins directly -->
        </pluginManagement>

        <plugins>
        <!-- plugins that should be executed as part of the build process for the current project -->
        </plugins>
    </build>
</project>
```

##### Plugin Management
configuration to manage plugin versions and configurations that can be inherited by child modules without applying the plugins directly

```xml
<project>
    ....
    <build>
        <pluginManagement> 
         <!-- used to centrally manage plugin versions and configurations that can be inherited by child modules 
                 without applying the plugins directly -->
        </pluginManagement>
        ...
    </build>
</project>
```

###### Plugins under Plugin Management
```xml
<project>
    ....
    <build>
        <pluginManagement>
            <plugins>
                <!-- Plugins under Plugin Managements -->
            </plugins>
        </pluginManagement>
        ...
    </build>
</project>
```

* checkstyle build plugin as optional plugin for child modules

```xml
                <!-- Checkstyle plugin for ensuring code style-->
                <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-checkstyle-plugin</artifactId>
                    <version>${maven.checkstyleplugin.version}</version>
                    <executions>
                        <execution>
                            <id>validate</id>
                            <phase>validate</phase>
                            <configuration>
                                <configLocation>
                                    https://raw.githubusercontent.com/wso2/code-quality-tools/v1.3/checkstyle/checkstyle.xml
                                </configLocation>
                                <suppressionsLocation>
                                    https://raw.githubusercontent.com/wso2/code-quality-tools/v1.3/checkstyle/suppressions.xml
                                </suppressionsLocation>
                                <encoding>UTF-8</encoding>
                                <consoleOutput>true</consoleOutput>
                                <failsOnError>true</failsOnError>
                                <includeTestSourceDirectory>true</includeTestSourceDirectory>
                            </configuration>
                            <goals>
                                <goal>check</goal>
                            </goals>
                        </execution>
                    </executions>
                </plugin>
```

* findsecbug with maven spotbugs build plugin as optional plugin for child modules

``` xml
                <!-- Find Sec Bugs plugin with Maven Spotbugs plugin for checking security bugs in the code-->
                <plugin>
                    <groupId>com.github.spotbugs</groupId>
                    <artifactId>spotbugs-maven-plugin</artifactId>
                    <version>${spotbugs-maven-plugin.version}</version>
                    <configuration>
                        <effort>Max</effort>
                        <threshold>Low</threshold>
                        <failOnError>false</failOnError>
                        <plugins>
                            <plugin>
                                <groupId>com.h3xstream.findsecbugs</groupId>
                                <artifactId>findsecbugs-plugin</artifactId>
                                <version>${findsecbugs-plugin.version}</version>
                            </plugin>
                        </plugins>
                    </configuration>
                    <executions>
                        <execution>
                            <id>analyze-compile</id>
                            <phase>compile</phase>
                            <goals>
                                <goal>check</goal>
                            </goals>
                        </execution>
                    </executions>
                </plugin>
```

##### Other Plugins
configurations of plugins that should be executed as part of the build process for the current project
```xml
<project>
    ....
    <build>
        .....

        <plugins>
        <!-- plugins that should be executed as part of the build process for the current project -->
        </plugins>
    </build>
</project>
```
* maven compiler plugin
```xml
          <!-- Maven Compiler plugin -->
          <plugin>
              <groupId>org.apache.maven.plugins</groupId>
              <artifactId>maven-compiler-plugin</artifactId>
              <version>${maven.compiler.plugin.version}</version>
              <configuration>
                  <source>${maven.compiler.source}</source>
                  <target>${maven.compiler.target}</target>
              </configuration>
          </plugin>
```

* maven bundle plugin for building OSGI bundles and how to exclude root artifact if necessary
```xml
            <!-- Maven Bundle plugin for building OSGI bundles -->
            <plugin>
                <groupId>org.apache.felix</groupId>
                <artifactId>maven-bundle-plugin</artifactId>
                <version>${maven.bundle.plugin.version}</version>
                <extensions>true</extensions>
                <configuration>
                    <!-- Disables the use of an OBR: OSGI Bundle Repository for managing this bundle.
                    This bundle will not be published to or retrieved from an OBR. -->
                    <obrRepository>NONE</obrRepository>
                </configuration>
            </plugin>
```

* checkstyle plugin for ensuring code style
```xml
            <!-- Checkstyle plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-checkstyle-plugin</artifactId>
            </plugin>
```
  
* maven spotbugs plugin with findsecbugs for checking security bugs in the code
```xml
            <!-- Spotbugs plugin -->
            <plugin>
                <groupId>com.github.spotbugs</groupId>
                <artifactId>spotbugs-maven-plugin</artifactId>
            </plugin>
```

* dependency check plugin for checking vulnerabilities of dependencies
```xml
            <!-- Dependency Check plugin: for checking vulnerabilities of dependencies-->
            <plugin>
                <groupId>org.owasp</groupId>
                <artifactId>dependency-check-maven</artifactId>
                <version>10.0.2</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>check</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
```

#### Dependencies 
for defining global dependencies for the project; applicable for all sub modules 
```xml
<project>
    ....
    <dependencies>
        <!-- List of global dependencies of the project -->
    </dependencies>
</project>
```

* dependency: for adding HTTP clients
```xml
        <!-- HTTP Client -->
        <dependency>
            <groupId>org.wso2.orbit.org.apache.httpcomponents</groupId>
            <artifactId>httpclient</artifactId>
            <version>${apache.httpclient.version}</version>
            <scope>provided</scope>
        </dependency>
```

#### Properties
global properties applicable for whole project
```xml
<project>
    ....
    <properties>
        <!-- List of global properties of the project -->
    </properties>
</project>
```

#### Repositories
repositories to download dependencies from
```xml
<project>
    ....
    <repositories>
        <!-- List of repositories to look for dependencies in order -->
    </repositories>
</project>
```

### 2. Sub module pom

* artifact id, version, packaging and description of the module
* declaring parent group id, artifact id and version

```xml
<project>
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.example</groupId>
        <artifactId>example</artifactId>
        <version>1.0.0</version>
    </parent>

    <artifactId>module1</artifactId>
    <version>1.0.0</version>
    <packaging>bundle</packaging>
    <description>Module 1</description>
</project>
```

#### Build
build configurations for the current module
```xml
<project>
    ....
    <build>
        <plugins>
            <!--  plugins that should be executed as part of the build process for the current module -->
        </plugins>
    </build>
</project>
```

##### Plugins
configurations of plugins that should be executed as part of the build process for the current module

* maven compiler plugin
```xml
            <!-- Maven Compiler plugin for compiling the module -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>${maven.compiler.plugin.version}</version>
                <configuration>
                    <source>${maven.compiler.source}</source>
                    <target>${maven.compiler.target}</target>
                </configuration>
            </plugin>
```

* maven bundle plugin for building OSGI bundles and providing configuration instructions for generating metadata for OSGI bundles
```xml
            <!-- Maven Bundle plugin for building OSGI bundles -->
            <plugin>
                <groupId>org.apache.felix</groupId>
                <artifactId>maven-bundle-plugin</artifactId>
                <version>${maven.bundle.plugin.version}</version>
                <extensions>true</extensions>
                <configuration>
                    <instructions>
                        <Bundle-SymbolicName>${project.artifactId}</Bundle-SymbolicName>
                        <Bundle-Name>${project.artifactId}</Bundle-Name>
                        <Private-Package>org.sampathbank.carbon.identity.oauth2.grant.jwt.internal</Private-Package>
                        <Export-Package>
                            !com.example.package1.internal,
                            com.example.*;version="${project.version}"
                        </Export-Package>
                        <Import-Package>
                            org.osgi.framework; version="${osgi.framework.imp.pkg.version.range}",
                            org.osgi.service.component; version="${osgi.service.component.imp.pkg.version.range}",
                            *;resolution:=optional
                        </Import-Package>
                        <DynamicImport-Package>*</DynamicImport-Package>
                    </instructions>
                </configuration>
            </plugin>
```

* maven SCR plugin for buildinh metadata of OSGI declarative services from annotations
```xml
            <!-- Maven SCR plugin: builds metadata of OSGI declarative services from annotations -->
            <plugin>
                <groupId>org.apache.felix</groupId>
                <artifactId>maven-scr-plugin</artifactId>
                <version>${maven.scr.plugin.version}</version>
                <executions>
                    <execution>
                        <id>generate-scr-scrdescriptor</id>
                        <goals>
                            <goal>scr</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
```

* checkstyle plugin for ensuring code style of the module;  can use with configurations defined in the root pom or new custom configurations defined in the module level
```xml
            <!-- Checkstyle plugin -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-checkstyle-plugin</artifactId>
            </plugin>
```

* maven spotbugs plugin for checking security bugs in the code; can use with configurations defined in the root pom or new custom configurations defined in the module level
```xml
            <!-- Spotbugs plugin -->
            <plugin>
                <groupId>com.github.spotbugs</groupId>
                <artifactId>spotbugs-maven-plugin</artifactId>
            </plugin>
```


#### Dependencies
module specific dependencies
```xml
<project>
    .....
    <dependencies>
        <!-- Add the module dependencies here -->
        <!-- no need to mention versions/scope, if the dependencies are inherited from root pom -->
    </dependencies>
</project>
```

#### Properties
module specific properties  
```xml
<project>
    .....
    <properties>
        <!-- Module specific properties -->
    </properties>
</project>
```

