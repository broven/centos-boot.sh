init:
	docker pull centos:7
	brew install shellcheck  #https://github.com/koalaman/shellcheck
.PHONY: test
test:
	shellcheck ./install.sh
	shellcheck ./test.sh
	docker image build -t centos-test .
	docker run centos-test
