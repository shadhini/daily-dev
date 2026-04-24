# Setting Environment Variables in POSIX Shell Script: `: "${VAR:=default}"` vs `VAR=${VAR:-default}`


## **1. `: "${ENVIRONMENT:=development}"`**

- **What it does:**
    - Sets `ENVIRONMENT=development` **only if** `ENVIRONMENT` is unset or empty
    - The `:` is a **no-op command** (does nothing), so the expansion happens **in place**
    - The variable is **exported** if it was previously exported, or remains non-exported if it wasn't

- **Use case:** You want to ensure the variable has a default value **without** reassigning it (preserves export status)

```bash
: "${ENVIRONMENT:=development}"
echo "$ENVIRONMENT"  # → development (if unset)
```

---

## **2. `ENVIRONMENT=${ENVIRONMENT:-development}`**

- **What it does:**
    - **Assigns** `ENVIRONMENT=development` **only if** `ENVIRONMENT` is unset or empty
    - Creates a **new variable assignment** (even if the value is the same)
    - The variable is **not exported** unless you explicitly `export` it

- **Use case:** You want to explicitly assign a default value and potentially change the variable's export status

```bash
ENVIRONMENT=${ENVIRONMENT:-development}
echo "$ENVIRONMENT"  # → development (if unset)
```

---

## **Key Differences:**

| Feature                     | `: "${VAR:=default}"` | `VAR=${VAR:-default}`         |
|-----------------------------|-----------------------|-------------------------------|
| **Sets default**            | ✅ Yes                 | ✅ Yes                         |
| **Triggers assignment**     | ✅ Yes                 | ✅ Yes                         |
| **Preserves export status** | ✅ Yes                 | ❌ No (creates new assignment) |
| **Use in if/test**          | ✅ Can be used alone   | ❌ Must be part of assignment  |
| **Common in entrypoints**   | ✅ Yes (idiomatic)     | ✅ Yes (explicit)              |

---

## Explanation using an example:

```bash
FINAL_CONFIG=${CONFIG_PATH:-${RUNTIME_DIR}/config.yml}
```

This is **assignment syntax** — it sets `FINAL_CONFIG` to `CONFIG_PATH` if set, otherwise to `/batti-ffs/runtime/config.yml`. The variable won't be exported unless you add `export`.

If you wanted to ensure `CONFIG_PATH` has a default **and** export it, you'd use:

```bash
: "${CONFIG_PATH:=${RUNTIME_DIR}/config.yml}"
export CONFIG_PATH
```

---

## **Recommendation for entrypoint :**

Use **`: "${VAR:=default}"`** because:
- It's idiomatic in shell scripts for setting defaults
- Preserves export status from secrets/env files
- Cleaner when you have many variables

```bash
: "${HEC_HMS_VERSION:=unknown}"
: "${HEC_HMS_DOWNLOAD_URL:=https://github.com/HydrologicEngineeringCenter/hec-downloads/releases/download/1.0.19/HEC-HMS-4.8-linux64.tar.gz}"
: "${ENVIRONMENT:=development}"
: "${HEC_HMS_LOCAL_PACKAGE_PATH:=}"
```
