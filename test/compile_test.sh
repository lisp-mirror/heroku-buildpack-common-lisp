#!/bin/sh

. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

testCompile() {
  ls -lR "$BUILDPACK_HOME"
  cp -R "${BUILDPACK_HOME}/fixtures/ccl/*" "${BUILD_DIR}"

  compile
  assertCapturedSuccess
}