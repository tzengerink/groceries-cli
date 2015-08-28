all: help

help:
	@echo 'check     -- check the code syntax'
	@echo 'clean     -- cleanup the environment'
	@echo 'install   -- install the command'

check:
	flake8 groceries

clean:
	find . -name '__pycache__' -delete -o -name '*.pyc' -delete

install:
	pip install --editable .

unittest:
	coverage run --source groceries --module pytest tests
	coverage report --fail-under=100 --show-missing
