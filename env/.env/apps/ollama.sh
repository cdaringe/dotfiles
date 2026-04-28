#!/bin/bash
OLLAMA_HOST=0.0.0.0
function ollama_ui() {
  local OLLAMA_UI_IMAGE="ghcr.io/open-webui/open-webui:main"
  docker pull "$OLLAMA_UI_IMAGE"
  printf "\n\n\nun/pw: admin@admin.com / admin\n\n\n"
  # docker run -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always "$OLLAMA_UI_IMAGE"
  docker run --rm -p 3000:8080 --network host -v ~/src/open-webui/data:/app/backend/data --name open-webui  "$OLLAMA_UI_IMAGE"
}

function ollamasafe() {
  GGML_NUM_THREADS=1 \
    OLLAMA_CONTEXT_LENGTH=2048 \
    OLLAMA_DEBUG=1 \
    OLLAMA_FLASH_ATTENTION=0 \
    OLLAMA_MAX_LOADED_MODELS=1 \
    OLLAMA_NUM_PARALLEL=1 \
    OLLAMA_HOST=0.0.0.0 \
  ollama serve "$@"
}