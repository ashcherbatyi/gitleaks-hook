
# Gitleaks Pre-Commit Hook

This repository uses a Git `pre-commit` hook to automatically scan for secrets in the codebase using [Gitleaks](https://github.com/gitleaks/gitleaks).

## Installation and Usage

1. **Copy the hook script:**

   Copy the provided `pre-commit` hook script into your repository's `.git/hooks/` directory:

   ```bash
   cp path_to_your_script/pre-commit .git/hooks/pre-commit
   ```

2. **Make the script executable:**

   Ensure the hook script is executable:

   ```bash
   chmod +x .git/hooks/pre-commit
   ```

3. **Enable the Gitleaks hook:**

   To enable the Gitleaks hook, run the following command:

   ```bash
   git config --bool hooks.gitleaks true
   ```

4. **Specify Gitleaks version (optional):**

   If you need a specific version of Gitleaks, you can specify it using an environment variable:

   ```bash
   export GITLEAKS_VERSION="8.18.4"
   ```

   By default, the script uses version `8.18.4`.

5. **Commit your changes:**

   When you commit your changes, the script will automatically:

   - Check if Gitleaks is installed. If not, it will download and install it to `/usr/local/bin`.
   - Run Gitleaks on the entire repository.
   - If any secrets are detected, the commit will be blocked, and you will need to resolve the issues before committing again.

6. **Uninstall or Disable the Hook:**

   If you wish to disable the Gitleaks hook, you can do so by running:

   ```bash
   git config --bool hooks.gitleaks false
   ```

## Example Output

- **No Secrets Detected:**

   ```bash
   Running gitleaks to check the entire repository...
   No secrets detected. Proceeding with commit.
   ```

- **Secrets Detected:**

   ```bash
   Running gitleaks to check the entire repository...
   Secrets detected! Please fix the issues before committing.
   ```

## Notes

- The script installs Gitleaks to `/usr/local/bin` using `sudo`. Ensure that you have the necessary permissions to install to this directory.
- The script only works if the hook is enabled via `git config`.
```
