#!/usr/bin/env bash

# Start the FB Messenger-Jarvis server
# return (int): 0 if success, 1 if failed
jv_pg_fb_start()
{
  jv_debug "Starting Facebook messenger-Jarvis server with user '$var_jv_pg_fb_email'"

  # Start the server
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  nohup python3 $dir/script/facebook_handler.py --email "$var_jv_pg_fb_email" --password "$var_jv_pg_fb_password" --allowControlAll "$var_jv_pg_fb_allow_all_control" --allowedIds "$var_jv_pg_fb_allowed_people_ids" >/dev/null 2>/dev/stdout & 
}

# Send message and/or image via Facebook Messenger
# $1 (string): ID of the user to send message
# $2 (string): Name of the user to send message
# $3 (string): Message to send
# $4 (string, optional): Path of the image to send
# $5 (bool, optional): Silent ("True" for no Jarvis response, "False" or no value for Jarvis response)
#
# return (int): 0 if success, 1 if failed
jv_pg_fb_send_message()
{
  # Send message
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local result=`python3 $dir/script/fb_messenger_send.py --email "$var_jv_pg_fb_email" --password "$var_jv_pg_fb_password" --receiver "$1" --message "$3" --image "$4"`

  # Show the result to user (if requested)
  if [[ $? -eq 0 ]]; then
    if [[ ! $5 =~ "True" ]]; then
      say "$(jv_pg_fb_lang send_message_success $2)"
    fi
    return 0
  else
    if [[ ! $5 =~ "True" ]]; then
      say "$(jv_pg_fb_lang send_message_failed $2)"
    fi
  fi

  return 1
}

# Start the Facebook messenger server during Jarvis initialization
# (do not start FB messenger server if just executing an order)
[ "$just_execute" == false ] && jv_pg_fb_start
