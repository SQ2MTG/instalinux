# INSTALINUX

![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Debian](https://img.shields.io/badge/Debian-supported-A81D33?style=for-the-badge&logo=debian&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-supported-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Version](https://img.shields.io/badge/version-0.6-blue?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)

```
██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║████╗  ██║██║   ██║╚██╗██╔╝
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║██║╚██╗██║██║   ██║ ██╔██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝
```

> 🌐 Language: [Polski](README.md) | **English**

> An interactive script that automates the initial configuration of a fresh Debian / Ubuntu installation.  
> Handles package installation, privilege configuration and deployment of popular software —  
> all through a clean `whiptail` menu interface.

---

## 📋 Table of Contents

- [Requirements](#-requirements)
- [Installation & Usage](#-installation--usage)
- [Features](#-features)
- [Packages](#-packages)
- [Optional Software](#-optional-software)
- [Script Structure](#-script-structure)
- [Author](#-author)

---

## ✅ Requirements

| Requirement | Details |
|-------------|---------|
| OS | Debian or Ubuntu |
| Privileges | root or user with `sudo` |
| Dependencies | `bash`, `whiptail`, `apt` |

> **Note:** `whiptail`, `dialog` and `sudo` will be installed automatically at the beginning of the script if they are missing.

---

## 🚀 Installation & Usage

### Download and run in one command:

```bash
curl -fsSL https://raw.githubusercontent.com/SQ2MTG/instalinux/instalinux.sh -o instalinux.sh && chmod +x instalinux.sh && sudo ./instalinux.sh
```

### Or manually:

```bash
# 1. Clone the repository
git clone https://github.com/SQ2MTG/instalinux.git

# 2. Enter the directory
cd instalinux

# 3. Make it executable
chmod +x instalinux.sh

# 4. Run
sudo ./instalinux.sh
```

---

## ⚙️ Features

### 🔐 Privilege Management
- Automatic escalation to `root` via `sudo` or `su`
- Ability to add a user to the `sudo` group (Debian only)
- Ubuntu is skipped automatically — sudo is configured by default

### 💾 Disk Space Check
- Verifies available disk space before each installation stage
- Warning triggered when disk usage exceeds **85%**
- Option to continue or abort after the warning

### 📦 Package Installation
- Interactive `whiptail` checklist
- Progress bar for each installed package
- Confirmation dialog before installation begins

### 🛠️ Optional Software
- Interactive selection menu for additional tools
- Automatic creation of working directories under `/opt`
- Cleanup of temporary files after completion

---

## 📦 Packages

Available for selection during interactive installation:

| Package | Description |
|---------|-------------|
| `git` | Version control system |
| `ssh` | OpenSSH client |
| `curl` | URL data transfer tool |
| `wget` | File downloader |
| `gzip` | File compression |
| `make` | Build automation tool |
| `cmake` | Cross-platform build system |
| `build-essential` | Essential compilation tools |
| `gdebi` | `.deb` package installer |
| `htop` | Interactive process monitor |
| `rdate` | Time synchronization |
| `nodejs` + `npm` | Node.js runtime environment |
| `php` | PHP interpreter |
| `audio` | Audio packages (`alsa-utils`, `libasound2-dev`) |

---

## 🧩 Optional Software

| Option | What it does |
|--------|-------------|
| `rc_local` | Restores support for `/etc/rc.local` |
| `sdr_rtl` | Compiles and installs RTL-SDR drivers + configures kernel blacklist |
| `sdr_rsp1` | Compiles `libmirisdr-4` library for RSP1 receiver |
| `vpn_wireguard` | Installs WireGuard and VPN tools |
| `vpn_zerotier` | Installs ZeroTier via official script |
| `cockpit` | Installs Cockpit web panel with plugins |
| `docker` | Installs Docker, Docker Compose and launches Portainer agent |
| `lynis` | Installs Lynis — system security audit tool |

---

## 🗂️ Script Structure

```
instalinux.sh
│
├── check_sudo()        # Escalate privileges to root
├── addsudo()           # Add user to sudo group (Debian only)
├── check_disk_space()  # Check available disk space
├── pkg_install()       # Interactive package installation
├── opt_install()       # Optional software installation
│
└── [main script]
    ├── Sudo configuration
    ├── Dependency installation (whiptail, dialog)
    ├── Create directories /opt/{log,skrypty,backup,cloud}
    ├── Disk check → pkg_install
    ├── Disk check → opt_install
    └── Cleanup + apt clean/autoclean/autoremove
```

---

## 📁 Working Directories

The script automatically creates a directory structure under `/opt`:

```
/opt/
├── log/        # System and application logs
├── skrypty/    # Custom scripts and automations
├── backup/     # Backups
└── cloud/      # Cloud service related files
```

---

## 🧪 Tested On

- ✅ Debian 11 (Bullseye)
- ✅ Debian 12 (Bookworm)
- ✅ Ubuntu 22.04 LTS
- ✅ Ubuntu 24.04 LTS

---

## 👤 Author

**SQ2MTG**  
📅 2026  
🔖 version `0.6`

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).  
You are free to use, modify and distribute it.
