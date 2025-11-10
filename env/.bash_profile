#!/bin/bash
. ~/.basher.sh
# Setting Python Requests Extra CA Path
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting CURL Extra CA Path
export CURL_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting gRPC Extra CA Path
export GRPC_DEFAULT_SSL_ROOTS_FILE_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting OpenSSL Extra CA Path
export SSL_CERT_FILE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting NodeJS Extra CA Path
export NODE_EXTRA_CA_CERTS="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Git SSL CA Info
export GIT_SSL_CAINFO="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting AWS CA Bundle
export AWS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Cargo CA Info
export CARGO_HTTP_CAINFO="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Conan C/C++ package manager CA Cert Path
export CONAN_CACERT_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Haskell Stack Certificate Path
export SYSTEM_CERTIFICATE_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Elixir Hex CA Certs Path
export HEX_CACERTS_PATH="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
# Setting Grype Anchore vulnerability scanner CA Cert
export GRYPE_DB_CA_CERT="/Library/Application Support/Netskope/STAgent/download/nscacert_combined.pem"
