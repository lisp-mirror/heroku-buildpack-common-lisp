#!/bin/sh

. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

testCompile() {
  SRC_DIR=dirname "$0"
  cp -R "$SRC_DIR/fixtures/ccl/*" "${BUILD_DIR}"
  compile
  assertCapturedSuccess
}