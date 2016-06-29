pacman-snapper-hook
===

Hooks for creating snapper pre- and post- snapshots before and after pacman transactions

Since the hooks themselves cannot pass information between them, and the post command requires the pre-number, a pair of auxiliary scripts are used and a small temp file created under `/var/tmp` to keep track of it.

Instructions
---

Build and install the package, or copy the files over manually

 - `snapper-*.hook` go to `/usr/share/libalpm/hooks`
 - `snapper-*.sh` go to `/usr/local/bin` *(or wherever you prefer, just make sure to change it on the hook files)*

The hooks are set to **fail** in case of error taking the snapshot. If that's not what you want, then either comment the `AbortFail` directive on the hook files or, if you're feeling particularly lazy, just set the last line to `exit 0` on the pre- helper script.

**BEWARE** that doing the above, however, might just kill you with the very weapon you're trying to use to defend yourself. You've been warned.

Rights
---

You have the right to get screwed by this, but you DON'T have the right to complain to me about it. No warranties, safeguards or anything else provided.

Licensing
---

These scripts are licensed under public domain. Feel free to do whatever you want with them (because putting something like this under whatever license is not only useless, but waaay to much work for a dozen lines of obvious code).
