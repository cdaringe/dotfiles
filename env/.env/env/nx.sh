function clean_nx() {
  fd -HI -t d  "\.next" apps/ -X mv {} /tmp/nextcache_$(echo "$(date)(echo {})" | shasum | sed 's/ -//') || true
  mv dist /tmp/$(echo "dist_$(date)" | shasum | sed 's/ -//') || true
  mv node_modules/.cache /tmp/$(echo "nmcache_$(date)" | shasum | sed 's/ -//') || true
}