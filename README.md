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

> 🌐 Language: **Polski** | [English](README_eng.md)


> Interaktywny skrypt automatyzujący konfigurację świeżej instalacji Debian / Ubuntu.  
> Obsługuje instalację pakietów, konfigurację uprawnień i wdrożenie popularnego oprogramowania —  
> wszystko przez czytelne menu `whiptail`.

---

## 📋 Spis treści

- [Wymagania](#-wymagania)
- [Instalacja i uruchomienie](#-instalacja-i-uruchomienie)
- [Funkcje](#-funkcje)
- [Pakiety](#-pakiety)
- [Oprogramowanie opcjonalne](#-oprogramowanie-opcjonalne)
- [Struktura skryptu](#-struktura-skryptu)
- [Autor](#-autor)

---

## ✅ Wymagania

| Wymaganie | Szczegóły |
|-----------|-----------|
| System | Debian lub Ubuntu |
| Uprawnienia | root lub użytkownik z `sudo` |
| Zależności | `bash`, `whiptail`, `apt` |

> **Uwaga:** `whiptail`, `dialog` i `sudo` zostaną zainstalowane automatycznie na początku działania skryptu, jeśli ich brakuje.

---

## 🚀 Instalacja i uruchomienie

### Pobierz i uruchom jedną komendą:

```bash
curl -fsSL https://raw.githubusercontent.com/SQ2MTG/instalinux/0.6/instalinux -o instalinux && chmod +x instalinux && sudo ./instalinux
```

### Lub ręcznie:

```bash
# 1. Sklonuj repozytorium
git clone https://github.com/SQ2MTG/instalinux.git

# 2. Przejdź do katalogu
cd instalinux

# 3. Nadaj uprawnienia
chmod +x instalinux

# 4. Uruchom
sudo ./instalinux
```

---

## ⚙️ Funkcje

### 🔐 Zarządzanie uprawnieniami
- Automatyczna eskalacja do `root` przez `sudo` lub `su`
- Możliwość dodania użytkownika do grupy `sudo` (wyłącznie Debian)
- Ubuntu pomijane automatycznie — sudo jest domyślnie skonfigurowane

### 💾 Sprawdzanie dysku
- Weryfikacja wolnego miejsca przed każdym etapem instalacji
- Ostrzeżenie przy zajętości powyżej **85%**
- Możliwość kontynuacji lub przerwania po ostrzeżeniu

### 📦 Instalacja pakietów
- Interaktywna checklista `whiptail`
- Pasek postępu dla każdego instalowanego pakietu
- Okno potwierdzenia przed instalacją

### 🛠️ Oprogramowanie opcjonalne
- Interaktywne menu wyboru dodatkowych narzędzi
- Automatyczne tworzenie katalogów roboczych w `/opt`
- Czyszczenie plików tymczasowych po zakończeniu

---

## 📦 Pakiety

Dostępne do wyboru podczas interaktywnej instalacji:

| Pakiet | Opis |
|--------|------|
| `git` | System kontroli wersji |
| `ssh` | Klient OpenSSH |
| `curl` | Transfer danych URL |
| `wget` | Pobieranie plików |
| `gzip` | Kompresja plików |
| `make` | Narzędzie budowania |
| `cmake` | System budowania projektów |
| `build-essential` | Podstawowe narzędzia kompilacyjne |
| `gdebi` | Instalacja pakietów `.deb` |
| `htop` | Monitor procesów |
| `rdate` | Synchronizacja czasu |
| `nodejs` + `npm` | Środowisko Node.js |
| `php` | Interpreter PHP |
| `audio` | Pakiety audio (`alsa-utils`, `libasound2-dev`) |

---

## 🧩 Oprogramowanie opcjonalne

| Opcja | Co robi |
|-------|---------|
| `rc_local` | Przywraca obsługę `/etc/rc.local` |
| `sdr_rtl` | Kompiluje i instaluje sterowniki RTL-SDR + konfiguruje blacklistę kernela |
| `sdr_rsp1` | Kompiluje bibliotekę `libmirisdr-4` dla odbiornika RSP1 |
| `vpn_wireguard` | Instaluje WireGuard i narzędzia VPN |
| `vpn_zerotier` | Instaluje ZeroTier przez oficjalny skrypt |
| `cockpit` | Instaluje panel webowy Cockpit z pluginami |
| `docker` | Instaluje Docker, Docker Compose i uruchamia agenta Portainer |
| `lynis` | Instaluje Lynis — narzędzie do audytu bezpieczeństwa systemu |

---

## 🗂️ Struktura skryptu

```
instalinux.sh
│
├── check_sudo()        # Eskalacja uprawnień do root
├── addsudo()           # Dodanie użytkownika do grupy sudo (Debian)
├── check_disk_space()  # Sprawdzenie wolnego miejsca na dysku
├── pkg_install()       # Interaktywna instalacja pakietów
├── opt_install()       # Instalacja oprogramowania opcjonalnego
│
└── [główny skrypt]
    ├── Konfiguracja sudo
    ├── Instalacja zależności (whiptail, dialog)
    ├── Tworzenie katalogów /opt/{log,skrypty,backup,cloud}
    ├── Sprawdzenie dysku → pkg_install
    ├── Sprawdzenie dysku → opt_install
    └── Cleanup + apt clean/autoclean/autoremove
```

---

## 📁 Katalogi robocze

Skrypt automatycznie tworzy strukturę katalogów w `/opt`:

```
/opt/
├── log/        # Logi systemowe i aplikacyjne
├── skrypty/    # Własne skrypty i automatyzacje
├── backup/     # Kopie zapasowe
└── cloud/      # Pliki związane z usługami chmurowymi
```

---

## 🧪 Testowane na

- ✅ Debian 11 (Bullseye)
- ✅ Debian 12 (Bookworm)
- ✅ Debian 13 (Trixie)
- ✅ Ubuntu 22.04 LTS
- ✅ Ubuntu 24.04 LTS

---

## 👤 Autor

**SQ2MTG**  
📅 2026  
🔖 wersja `0.6`

---

## 📄 Licencja

Projekt udostępniony na licencji [MIT](LICENSE).  
Możesz go swobodnie używać, modyfikować i dystrybuować.
