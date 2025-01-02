# Monday Promote App Script

This script is used to promote your Monday app to live using the `mapps` CLI tool.

## Prerequisites

Ensure you have the following:
- A valid Monday developer token.
- Access to the `mapps` CLI installed and configured on your machine.

## Script Usage

### Arguments

1. **`TOKEN`** (Required)  
   Your Monday developer token.  
   Can be acquired here: https://<your-monday-subdomain>.monday.com/apps/manage/tokens

2. **`APP_ID`** (Mandatory if `VERSION_ID` is provided)  
   The app ID to promote.  
   Can be found using the `mapps app:list` command or in the Developer Center.

3. **`VERSION_ID`** (Optional)  
   The version ID to promote, will promote the latest draft version if this param will be empty.  
   Can be found using the `mapps app-version:list` command or in the Developer Center.

### Example Usage in a Workflow

```yaml
name: Promote app to live

on:
  push:
    branches:
      - main

jobs:
  promote:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Promote app to live
        run: |
          ./mapps_deploy_script.sh ${{ secrets.MONDAY_TOKEN }} 10110073 20210004
``` 

### Script Functionality

1. Initializes the `mapps` CLI with the provided token.
2. Checks and prepares arguments for:
   - App ID (`-a`)
   - Version ID (`-i`)
3. Runs the `mapps app::promote` command with the provided arguments.
