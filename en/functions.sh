#!/usr/bin/env bash

jv_pg_fb_lang()
{
  case "$1" in
    send_message_success) echo "Facebook message sent to $2";;
    send_message_failed) echo "Failed to send facebook message to $2";;

    *) jv_error "Error: Translation key '$1' not recognized. Please contact the designer of this plugin.";;
  esac
}
