#!/bin/sh

. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

testCompile() {
  cp -R "${BUILDPACK_HOME}/test/fixtures/ccl/*" "${BUILD_DIR}"

  set

  echo "BUILD_DIR: $BUILD_DIR"
  ls -lR "${BUILD_DIR}"

  compile
  assertCapturedSuccess
}