# Logging Best Practices

## Libraries
- Libraries should log using `module-level loggers` 
  - logging.getLogger(name) or logging.getLogger("yourlib")
  - create hierarchical loggers that match your package structure
- Libraries must not configure the root logger or call logging.basicConfig() 
  - leave configuration to application code
- Provide a `NullHandler` in your library 
  - so users who don’t configure logging get no noisy output
  - Libraries should never configure logging handlers by default
- Prefer passing structured data 
  - via the logging "extra" dict or use LoggerAdapter/structlog for richer structured logs
- Document your logging behavior and provide an example app config in the README

### Key Principles

#### Python

1. ✅ **DO**: Add `NullHandler` to your library's root logger
2. ✅ **DO**: Use `logging.getLogger(__name__)` in each module -- per module logger
3. ✅ **DO**: Use lazy formatting (`%s`, `%d`) instead of f-strings
4. ✅ **DO**: Let users configure logging in their application -- use a `NullHandler`
5. ✅ **DO**: Document your logging behavior and provide an example app config in the `README`
6. ❌ **DON'T**: Call `logging.basicConfig()` in library code -- libraries should never configure logging handlers by 
   default
7. ❌ **DON'T**: Add any handlers except `NullHandler`
8. ❌ **DON'T**: Set logging levels in library code
9. ❌ **DON'T**: Configure logging output format


## Performance Considerations 

### Python

```python name=your_library/performance.py
import logging

logger = logging.getLogger(__name__)

# ✅ GOOD - String formatting only happens if message is logged
logger.debug("Processing item %s with data %s", item_id, data)

# ❌ BAD - String formatting happens even if debug is disabled
logger.debug(f"Processing item {item_id} with data {data}")
```

#### Check log level only for expensive computations:
Python's `logging` checks the level before formatting, and using the `%s`-style arguments defers formatting until needed.
So no need to check `logger.isEnabledFor(logging.DEBUG)` for simple log statements.

Use `logger.isEnabledFor(logging.DEBUG)` only when preparing the log arguments is expensive:

```python
python
# cheap / lazy formatting (good)
logger.debug("Directory created: %s", dir_path)

# expensive computation (guard with check)
if logger.isEnabledFor(logging.DEBUG):
    details = expensive_computation()
    logger.debug("Details: %s", details)
```
