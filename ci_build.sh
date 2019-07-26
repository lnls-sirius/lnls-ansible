#!/usr/bin/env bash

# This is based on CZMQ ci_build.sh script available at:
# https://github.com/zeromq/czmq/blob/v4.1.1/ci_build.sh

set -e

# Set this to enable verbose profiling
[ -n "${CI_TIME-}" ] || CI_TIME=""
case "${CI_TIME}" in
    [Yy][Ee][Ss]|[Oo][Nn]|[Tt][Rr][Uu][Ee])
        CI_TIME="time -p " ;;
    [Nn][Oo]|[Oo][Ff][Ff]|[Ff][Aa][Ll][Ss][Ee])
        CI_TIME="" ;;
esac

# Set this to enable verbose tracing
[ -n "${CI_TRACE-}" ] || CI_TRACE="no"
case "${CI_TRACE}" in
    [Nn][Oo]|[Oo][Ff][Ff]|[Ff][Aa][Ll][Ss][Ee])
        set +x ;;
    [Yy][Ee][Ss]|[Oo][Nn]|[Tt][Rr][Uu][Ee])
        set -x ;;
esac

case "${BUILD_TYPE}" in
    default)
        echo "Running default molecule test" >&2
        ${CI_TIME} cd ${ROLE} && molecule test
        ;;
    debug)
        echo "Running debug molecule test" >&2
        ${CI_TIME} cd ${ROLE} && molecule --debug test
        ;;
    *)
        echo "Invalid build type: ${BUILD_TYPE}" >&2
        ;;
esac
