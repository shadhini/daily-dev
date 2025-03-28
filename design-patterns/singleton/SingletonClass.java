/**
 * Singleton Pattern
 */
public class SingletonClass {

    // Singleton Instance Declaration
    // Declares a volatile static instance of the class for implementing the singleton pattern
    private static volatile SingletonClass instance;

    // Private Constructor
    // A private constructor to prevent instantiation from outside the class
    private SingletonClass() {
    }

    // Singleton Instance Getter
    // Double-checked locking: Ensures that the singleton instance is created only once in a thread-safe manner.
    public static SingletonClass getInstance() {

        if (instance == null) {
            synchronized (SingletonClass.class) {
                if (instance == null) {
                    instance = new SingletonClass();
                }
            }
        }
        return instance;
    }
}
