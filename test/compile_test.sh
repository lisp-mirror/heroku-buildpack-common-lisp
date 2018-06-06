#!/bin/sh

. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

testCompile() {
  echo "BUILD_DIR: $BUILD_DIR"
  echo "CACHE_DIR: $BUILD_DIR"
  echo "ENV_DIR: $ENV_DIR"
  echo "CL_IMPL: $CL_IMPL"

  echo "ls -l ${BUILD_DIR}"
  ls -l "${BUILD_DIR}"

  cp -R "${BUILDPACK_HOME}/../fixtures/ccl/*" "${BUILD_DIR}"
  compile
  assertCapturedSuccess
}