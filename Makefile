init:
	docker pull centos:7
	brew install shellcheck  #https://github.com/koalaman/shellcheck
.PHONY: test
test:
	shellcheck ./install.sh
	shellcheck ./test.sh
	docker rmi centos-test -f || true
	docker image build -t centos-test .
	docker run centos-test
	
repl_docker:
	docker run -it centos-test /bin/bash
