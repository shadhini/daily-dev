# Bash Shell Commands
`sh`

## Process Management

###### find processes running on a specific **port**

    lsof -i :<PORT_NUMBER>
---
    lsof -i :8080


###### find a process by name

    ps aux | grep <PROCESS_NAME>
---
    ps aux | grep mysql


###### kill a process

    kill -9 <PID>
---
    kill -9 1234


