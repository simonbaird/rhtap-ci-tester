
QUAY_ORG=sbaird
QUAY_REPO=rhtap-ci-tester
PUSH_REF=quay.io/$(QUAY_ORG)/$(QUAY_REPO)

build:
	podman build . -t $(PUSH_REF)

push:
	podman push $(PUSH_REF)

run:
	podman run --rm $(PUSH_REF)

GENERATED=../tssc-dev-multi-ci/generated/source-repo/
GITLAB_PIPELINE=.gitlab-ci.yml
GITHUB_PIPELINE=.github/workflows/build-and-update-gitops.yml

compare-gitlab:
	vimdiff $(GENERATED)/gitlabci/$(GITLAB_PIPELINE) $(GITLAB_PIPELINE)

compare-github:
	vimdiff $(GENERATED)/githubactions/$(GITHUB_PIPELINE) $(GITHUB_PIPELINE)
