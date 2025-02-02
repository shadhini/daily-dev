### OSGI console commands

List down the bundles in the server with bundle id

    ss
 
Search the given name in the bundle and list it out

    ss <NAME>

List down services

    ls

Show bundle info

    b <ID>

Show unsatisfied constraints of the bundle

    diag <ID>

Start/Stop a bundle

    start <ID>
    stop <ID>


Remove installed bundle

    uninstall <ID>

All registered services

    services

Detailed info about specific service

    inspect service <SERVICE_NAME>
 

Installing a bundle

    install file:<FULL_PATH_TO_JAR>
