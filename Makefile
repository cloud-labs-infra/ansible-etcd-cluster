init:
	pip install ansible molecule 'molecule[docker]'

verify:
	for env in default multi-node ; do \
  		echo "Trying to test ${env} scenario" ; \
		molecule create -s "${env}" ; \
		molecule converge -s "${env}" ; \
		molecule verify -s "${env}" ; \
		echo "Testing ${env} scenario is finished" ; \
	done
