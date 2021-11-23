export SSL_PATH=/usr/local/Cellar/openssl/1.0.2q/
export KERL_BUILD_BACKEND="git"
export KERL_CONFIGURE_OPTIONS="--without-javac \
			       --with-dynamic-trace=dtrace \
			       --with-ssl=${SSL_PATH}"