#!/usr/bin/env bats

# =======================================================================
#
# Testing the project
#
# @see https://github.com/sstephenson/bats
# @see https://blog.engineyard.com/2014/bats-test-command-line-tools
#
# =======================================================================

# Test ansible version
@test "Ansible version is ${ANSIBLE_VERSION}" {
	result="$(docker run ${DOCKER_APP_IMAGE_NAME} ansible --version)"
	[[ "$result" == *"ansible ${ANSIBLE_VERSION}"* ]]
	echo "-$result-"
}
