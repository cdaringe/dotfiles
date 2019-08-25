pyenv () {
  unset -f pyenv
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv "$@"
}

alias ppython="./.venv/bin/python"
alias vpython="./build/venv/bin/python"
alias vpytest="./build/venv/bin/py.test"
alias vpylint="./build/venv/bin/pylint"
alias django="./build/venv/bin/python ./build/venv/bin/manage runserver 3031 --settings=connect_rest.project.local_settings --nothreading --nostatic"
alias djangotest="PYTEST_ADDOPTS=--ds=tests.settings ./build/venv/bin/python setup.py pytest"
alias djangomakemigratrations="./build/venv/bin/manage makemigrations --settings=connect_rest.project.local_settings"
alias djangounmigrate="./build/venv/bin/manage migrate --settings=connect_rest.project.local_settings connect_rest 0001"
alias djangomigrate="./build/venv/bin/manage migrate --settings=connect_rest.project.local_settings"
v () {
  ./build/venv/bin/$@
}
