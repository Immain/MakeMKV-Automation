<p align="center">
  <img src="https://cdn.icon-icons.com/icons2/1381/PNG/512/makemkv_94419.png" alt="MakeMKV Automation Logo" width="200">
</p>

## About <a name = "about"></a>

Are you tired of manually managing and converting your movie collection? Leverage the power of MakeMKV to streamline and automate the process of digitizing your movies. With this tool, you can effortlessly convert your physical media into high-quality MKV files. Automate your movie collection hands-free with MakeMKV. This script streamlines the process of digitizing your physical media by:

1. Automatically detecting when a disk is inserted
2. Ripping the content using MakeMKV
3. Adding the ripped files to your designated media drive
4. Ejecting the disk when the process is complete
5. Waits for the next disk

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

5. Updating The Beta Key for MakeMKV:
   Create settings.conf in ```~/.MakeMKV/settings.conf```. In ```~/.MakeMKV/settings.conf``` add the following
   ```
   app_Key = "T-******"
   ```
   You can find the current makeMKV beta key [here](https://mysolutions.tech/makemkv-beta-key/)
