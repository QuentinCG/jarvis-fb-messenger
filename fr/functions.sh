#!/usr/bin/env bash

jv_pg_fb_lang()
{
  case "$1" in
    send_message_success) echo "Message facebook envoyé à $2";;
    send_message_failed) echo "Echec de l'envoi du message facebook à $2";;

    *) jv_error "Erreur: Clef de traduction '$1' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  esac
}
