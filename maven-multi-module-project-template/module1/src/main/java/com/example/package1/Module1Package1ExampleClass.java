package com.example.package1;

import java.util.logging.Logger;

public class Module1Package1ExampleClass {
    Logger logger = Logger.getLogger(Module1Package1ExampleClass.class.getName());

    public void hello() {
        logger.info("Hello from Module1 Package1 ExampleClass");
    }
}
