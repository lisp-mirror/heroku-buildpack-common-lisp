#!/bin/sh

# shellcheck disable=SC1090
. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

testCompile() {
  cp -Rv "${BUILDPACK_HOME}"/test/fixtures/ccl/* "${BUILD_DIR}"
  echo "BUILD_DIR: $BUILD_DIR"
  ls -lR "${BUILD_DIR}"
  compile

  ls -l "$BUILD_DIR/lispapp"
}