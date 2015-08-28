all: help

help:
	@echo 'check    -- check the code syntax'
	@echo 'clean    -- cleanup the environment'
	@echo 'install  -- install the command'
	@echo 'test     -- test entire codebase'
	@echo 'unittest -- run the unit tests'

check:
	flake8 groceries
	flake8 tests

clean:
	find . -name '__pycache__' -delete -o -name '*.pyc' -delete

install:
	pip install --force-reinstall --upgrade --editable .

test: install check unittest

unittest:
	coverage run --source groceries --module pytest tests
	coverage report --fail-under=100 --show-missing
	coveralls
