#!/bin/bash
# vim: filetype=sh:

log::clear() {
    printf "%s" "" | tee "$LOG_FILE" >&2 >/dev/null
}

log::error() {
    if [[ "${INTERACTIVE}" == "1" ]]; then
        printf "\r\033[2K  [\033[0;31mERROR\033[0m] %s\n" "$*"
    fi

    printf "[ ERROR ] %s\n" "$*" | tee -a "$LOG_FILE" >&2 >/dev/null
}

log::fatal() {
    if [[ "${INTERACTIVE}" == "1" ]]; then
        printf "\r\033[2K  [\033[0;31mFATAL\033[0m] %s\n" "$*"
    fi

    printf "[ FATAL ] %s\n" "$*" | tee -a "$LOG_FILE" >&2 >/dev/null
    exit 1
}

log::info() {
    if [[ "${INTERACTIVE}" == "1" ]]; then
        printf "  [ \033[00;34mINFO\033[0m ] %s\n" "$*"
    fi

    printf "  [ INFO ] %s\n" "$*" | tee -a "${LOG_FILE}" >&2 >/dev/null
}

log::set_interactive() {
    INTERACTIVE=0
    if test -t 1 && tput colors >/dev/null; then
        INTERACTIVE=1
    fi
}

log::set_log_file() {
    if [[ -z "${LOG_FILE+x}" ]]; then
        readonly LOG_FILE="/tmp/$(basename "$0").log"
    fi

    if [[ ! -d "$(dirname "${LOG_FILE}")" ]]; then
        mkdir -p "$(dirname "${LOG_FILE}")"
    fi
}

log::show() {
    less "${LOG_FILE}"
}

log::success() {
    if [[ "${INTERACTIVE}" == "1" ]]; then
        printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$*"
    fi

    printf "  [ SUCCESS ] %s\n" "$*" | tee -a "${LOG_FILE}" >&2 >/dev/null
}

log::timestamp() {
    TIME=$(date)
    if [[ "${INTERACTIVE}" == "1" ]]; then
        printf "  [ \033[00;34mTIME\033[0m ] %s\n" "$TIME"
    fi

    printf "  [ TIME ] %s\n" "$TIME" | tee -a "${LOG_FILE}" >&2 >/dev/null
}

log::warning() {
    if [[ "${INTERACTIVE}" == "1" ]]; then
        printf "  [ \033[00;34mWARNING\033[0m ] %s\n" "$*"
    fi

    printf "[ WARNING ] %s\n" "$*" | tee -a "$LOG_FILE" >&2 >/dev/null
}

log::set_log_file
log::set_interactive
