function backupdroplet () {
  rsync -avz --exclude-from "$BACKUP_FOLDER/exclude.txt" root@$DROPLET_IP:/www/ "$BACKUP_FOLDER/www";
}
