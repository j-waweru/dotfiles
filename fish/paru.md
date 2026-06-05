Here's a practical **Pacman + Paru cheat sheet** for Arch Linux and Arch-based distributions.

## Package Management

| Task                          | Pacman                     | Paru                |
| ----------------------------- | -------------------------- | ------------------- |
| Install package               | `sudo pacman -S package`   | `paru -S package`   |
| Install multiple packages     | `sudo pacman -S pkg1 pkg2` | `paru -S pkg1 pkg2` |
| Remove package                | `sudo pacman -R package`   | `paru -R package`   |
| Remove package + unused deps  | `sudo pacman -Rs package`  | `paru -Rs package`  |
| Remove package + config files | `sudo pacman -Rns package` | `paru -Rns package` |
| Upgrade all packages          | `sudo pacman -Syu`         | `paru -Syu`         |
| Refresh package databases     | `sudo pacman -Sy`          | `paru -Sy`          |

---

## Searching

| Task                        | Pacman               | Paru               |
| --------------------------- | -------------------- | ------------------ |
| Search repositories         | `pacman -Ss keyword` | `paru -Ss keyword` |
| Search installed packages   | `pacman -Qs keyword` | `paru -Qs keyword` |
| Show package info           | `pacman -Si package` | `paru -Si package` |
| Show installed package info | `pacman -Qi package` | `paru -Qi package` |

---

## AUR (Paru Only)

| Task                        | Command                     |
| --------------------------- | --------------------------- |
| Search AUR                  | `paru -Sa keyword`          |
| Install AUR package         | `paru -S package`           |
| Show AUR package info       | `paru -Si package`          |
| Upgrade repo + AUR packages | `paru -Syu`                 |
| Rebuild package             | `paru -S package --rebuild` |
| Clean build files           | `paru -Sc`                  |

---

## Query Installed Packages

| Task                          | Command                    |
| ----------------------------- | -------------------------- |
| List all installed packages   | `pacman -Q`                |
| Explicitly installed packages | `pacman -Qe`               |
| Orphaned packages             | `pacman -Qdt`              |
| Files installed by package    | `pacman -Ql package`       |
| Find owner of a file          | `pacman -Qo /path/to/file` |
| Verify package files          | `pacman -Qk package`       |

---

## Cleaning Cache

| Task                       | Command                            |
| -------------------------- | ---------------------------------- |
| Remove old cache packages  | `sudo pacman -Sc`                  |
| Remove all cached packages | `sudo pacman -Scc`                 |
| Clean cache with Paru      | `paru -Sc`                         |
| Remove orphaned packages   | `sudo pacman -Rns $(pacman -Qdtq)` |

---

## Package Files

| Task                                  | Command              |
| ------------------------------------- | -------------------- |
| List package contents (not installed) | `pacman -Fl package` |
| Search repositories for file          | `pacman -F filename` |
| Update file database                  | `sudo pacman -Fy`    |

---

## Dependency Inspection

| Task                       | Command              |
| -------------------------- | -------------------- |
| Show dependency tree       | `pactree package`    |
| Reverse dependencies       | `pactree -r package` |
| Check missing dependencies | `pacman -Dk`         |

---

## Useful Paru Features

| Task                           | Command                        |
| ------------------------------ | ------------------------------ |
| Interactive package search     | `paru keyword`                 |
| Review PKGBUILD before install | `paru -S package`              |
| Skip review prompts            | `paru --skipreview -S package` |
| Print PKGBUILD                 | `paru -Gp package`             |
| Download PKGBUILD only         | `paru -G package`              |

---

## Common Workflows

### Full system update

```bash
paru -Syu
```

### Install package from official repos or AUR

```bash
paru -S package-name
```

### Find and remove orphaned packages

```bash
pacman -Qdtq
sudo pacman -Rns $(pacman -Qdtq)
```

### Find which package owns a command

```bash
pacman -Qo $(which command)
```

### Check package information

```bash
paru -Si package-name
```

### Search for packages

```bash
paru firefox
```

---

## Safety Tips

* Use `paru -Syu` regularly instead of partial upgrades.
* Avoid running `pacman -Sy package`; on Arch, partial upgrades can break dependencies.
* Review AUR PKGBUILDs before installing unfamiliar packages.
* Remove orphaned packages periodically to keep the system clean.

### Most-used commands (daily use)

```bash
paru -Syu              # update system
paru -S package        # install package
paru package           # interactive search
paru -Rns package      # uninstall completely
pacman -Qdtq           # list orphans
paru -Sc               # clean cache
pacman -Qo file        # find package owning file
pacman -Ql package     # list installed files
```

