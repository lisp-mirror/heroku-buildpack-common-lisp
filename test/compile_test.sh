#!/bin/sh

. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

setUp() {
  cp -Rv "${BUILDPACK_HOME}"/test/fixtures/ccl/* "${BUILD_DIR}"
}

testCompile() {
  compile
  assertCapturedSuccess
}