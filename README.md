**Processor Affinity Setter for Black Desert Online**

This batch script automates setting processor affinity for Black Desert Online via Steam, ensuring the game launcher runs on specific CPU cores for optimized performance under the AMD roof.

## Features

- **Automated Launch:** Starts the game via Steam.
- **Configurable Affinity:** Sets a user-defined processor affinity mask for the game's launcher process.
- **Retry Mechanism:** Rechecks periodically until the affinity is set or retries are exhausted.
- **Console Feedback:** Provides clear status updates during execution.
- **Auto-Close:** Automatically exits once the affinity is successfully set.
## How it works + Usage/Explanation

How It Works

    1. Launches the game via Steam and waits for the game to initialize.
    2. Monitors for the launcher process (BlackDesertPatcher32.pae).
    3. Sets the specified processor affinity once the process is detected.
    4. Exits automatically if the affinity is successfully set.
    5. Retries periodically until successful or until the maximum retries are reached logging progress to the console.

**Step 1**

    Create the Batch File within the Black Desert Online folder:

        1. Open a text editor like Notepad.
        2. Copy and paste the script code into the text editor.
        3. Save the file with a .bat extension (e.g., SetAffinity.bat):
            In the Save As dialog, choose Save as type: All Files.
            Ensure the file name ends with .bat (e.g., SetAffinity.bat).

**Step 2**

    Right-click the .bat file, select Create Shortcut, and move the shortcut to your desktop or preferred location.

**Step 3:**

    Right-click the shortcut, go to Properties > Shortcut > Advanced, and enable Run as administrator.
    Always use the shortcut to execute the script.

**Edit Configuration (Optional):**

    Open the script in a text editor to modify:
        Affinity: Define the processor affinity mask (default: 0x0000000000005554).
        MaxRetries: Maximum retry attempts (default: 5).
        RetryInterval: Time in seconds between retries (default: 10).

**Important Note on Affinity Configuration:**

    The Affinity value (0x0000000000005554 by default) determines which CPU cores the game uses. 
        Each user must configure this value based on their specific CPU.
    
    Refer to the BDO Performance Guide for recommended core usage settings to maximize game performance. 
        Ensure your configuration aligns with these recommendations for the best results.


## Acknowledgements

 - [ACanadianDude's : Ultimate BDO Performance Guide](https://docs.google.com/document/d/1cyLaDiPL_B6nOZw_qPE_wOGuoeRT-qddTjevTFoFBkg/edit?tab=t.0#heading=h.rl325eap4pk9)
 - [CPU Affinity Mask Calculator](https://bitsum.com/tools/cpu-affinity-calculator/)
