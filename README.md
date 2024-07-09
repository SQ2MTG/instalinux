# InstaLinux

InstaLinux is a bash script designed for automating the setup and installation of various software packages and configurations on a Linux system.

## Features

- Checks if script is run with sudo privileges.
- Adds user 'gdz' to sudoers if not already added.
- Checks available disk space before proceeding with installations.
- Installs necessary packages like sudo, dialog, and creates directories under /opt/.
- Allows selection of packages and optional software configurations using dialog checkboxes.
- Configures specific modules and software based on user choices.
- Cleans up temporary files and performs system maintenance after installations.

## Usage

To use InstaLinux, simply run the script with sudo privileges:

```bash
su -c
chmod +x instalinux
./instalinux
