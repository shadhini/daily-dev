# Code Quality Checking & Security Vulnerability Checking Tools

## 1 Verify Vulnerabilities
When you find vulnerabilities in your code, it's crucial to **verify** whether they are **genuine issues**. 
Sometimes, a detected vulnerability might not actually be a risk given the specific context of your code.

In such cases, you can use **suppress annotations** to prevent these false positives from cluttering your analysis results.

## 2 Applying Suppress Annotations
* Apply the appropriate suppress annotation only to the specific code block that requires it, 
and ensure that this block is kept **as small as possible**.
* **Periodically review** suppressed warnings to ensure they remain justified as your code evolves.
