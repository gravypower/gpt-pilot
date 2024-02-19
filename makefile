# make files need tabs not spaces

test:
	pip install pytest
	pytest pilot -m "not slow and not uses_tokens and not ux_test"

lint:
	pip install flake8 ruff
	flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
	# stop the build if there are Python syntax errors or undefined names
	ruff --output-format=github --select=E9,F63,F7,F82 --target-version=py37 ./pilot
	# default set of ruff rules with GitHub Annotations
	ruff --output-format=github --target-version=py37 --ignore=F401,E402,E501 ./pilot