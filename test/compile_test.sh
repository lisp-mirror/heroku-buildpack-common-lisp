#!/bin/sh

. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

testCompile() {
  pwd
  ls -l
  cp -R "fixtures/ccl/*" "${BUILD_DIR}"
  compile
  assertCapturedSuccess
}