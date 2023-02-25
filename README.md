# Vaultwarden Backup
This container simply creates a backup of the vaultwarden directory from one volume to another.

This might not be the best solution for you, but suited my case (fast volume that's not backed up used for vaultwarden, another slow volume for backups).

The container expects the vaultwarden data directory mounted on `/vaultwarden` and the target directory for the backup mounted on `/backup`