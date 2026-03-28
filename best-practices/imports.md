# Code file Imports Organization Best Practices

## 1. Standard Library Imports
- Always import standard library modules first.
- Group them together and separate from third-party imports with a blank line.

## 2. Third-Party Imports
- After standard library imports, import third-party libraries.
- Group them together and separate from local imports with a blank line.

## 3. Local Application Imports
- Finally, import your own local modules or packages.
- Group them together at the end of the import section.

## 4. Alphabetical Order
- Within each group (standard, third-party, local), sort imports alphabetically by module name.

## 5. Avoid Wildcard Imports
- Do not use `from module import *` as it can lead to namespace pollution
and makes it unclear which names are present in the namespace.

## 6. Use Absolute Imports
- Prefer absolute imports over relative imports for better readability and maintainability.

## 7. Import Only What You Need
- Import only the specific classes, functions, or variables you need from a module rather than the entire module.

## Example of Properly Organized Imports

```python
# Standard library imports
import json
import logging
import os
from dataclasses import dataclass, field
from enum import Enum
from functools import lru_cache
from pathlib import Path
from typing import Any, Dict, List, Optional, Union

# Third-party imports
import yaml

# Local application imports
from .secrets import SecretManager
from .validator import SchemaValidator
```
