
QUAY_ORG=sbaird
QUAY_REPO=rhtap-ci-tester
PUSH_REF=quay.io/$(QUAY_ORG)/$(QUAY_REPO)

build:
	podman build . -t $(PUSH_REF)

push:
	podman push $(PUSH_REF)

run:
	podman run --rm $(PUSH_REF)

compare-gitlab:
	vimdiff ../tssc-dev-multi-ci/.gitlab-ci.yml ./.gitlab-ci.yml

compare-github:
	vimdiff ../tssc-dev-multi-ci/.github/workflows/build-and-update-gitops.yml ./.github/workflows/build-and-update-gitops.yml
