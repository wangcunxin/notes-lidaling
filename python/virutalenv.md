 ref :http://docs.python-guide.org/en/latest/dev/pip-virtualenv/

## install pip

  yum install python-pip

## install virtualenv

  pip install virtualenv

## make one venv

- prepare

  mkdir python_venv
  cd python_venv/
  virtualenv venv

- source ,activate venv python environment

  source venv/bin/activate

- install modules with python virtual environment

  pip install docker-compose

## custom python repositories in PyCharm

- manager repositories
- add `http://mirrors.aliyun.com/pypi/simple/`
