# Make MKV Automation Script
Are you tired of manually managing and converting your movie collection? Leverage the power of MakeMKV to streamline and automate the process of digitizing your movies. With this tool, you can effortlessly convert your physical media into high-quality MKV files. Automate your movie collection hands-free with MakeMKV. This script streamlines the process of digitizing your physical media by:

- Automatically detecting when a disk is inserted.
- Ripping the content using MakeMKV.
- Adding the ripped files to your designated media drive.
- Ejecting the disk when the process is complete.
- Waiting for the next disk.

## New Update 2/21/2025:
This update introduces an automated process for retrieving and updating the MakeMKV license key directly from the MakeMKV forum. Now, you don’t need to manually input the license key! The script automatically fetches and updates your MakeMKV key, ensuring the software remains activated.

## Key Update Process:
The script checks for the key in the MakeMKV settings file (~/.MakeMKV/settings.conf) and will either:

- Update an existing key if one is already present.
- Add a new key if it does not exist.
- The key is fetched from this URL: MakeMKV Forum Key.

With this automation in place, you can effortlessly build your digital movie library without manual intervention. Simply insert a disk, and let the script handle the rest, freeing you up for other tasks while your collection grows.

## Getting Started <a name = "getting_started"></a>

These instructions will help you set up and run the MakeMKV automation script on your system.

### Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/Immain/MakeMKV-Automation.git
   cd MakeMKV-Automation
   ```

2. Run the install script:
   ```
   ./install.sh
   ```

3. Make the run script executable:
   ```
   chmod +x run.sh
   ```

4. Start the bash script:
   ```
   ./run.sh
   ```
