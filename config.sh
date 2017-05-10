# Base configuration (mandatory)
var_jv_pg_fb_email="YOUR EMAIL ADDRESS HERE" # Facebook email used as username (used by Jarvis to send/receive messages/image)
var_jv_pg_fb_password="YOUR PASSWORD HERE" # Facebook password

# Security configuration
var_jv_pg_fb_allow_control_to_all="False" # Allow all people to control Jarvis (True/False)
var_jv_pg_fb_allowed_people_ids="[\"id_1_here\", \"id_2_here\", \"id_3_here\", \"...\"]" # List of allowed people (facebook IDs) to control Jarvis

# Used to send a messenger message from the command file or an other plugin (not needed for basic use of this plugin)
var_jv_pg_fb_main_receiver_id="YOUR RECEIVER ID HERE" # User which will receive message from Jarvis (if configured in command file or in other plugin with this key)
var_jv_pg_fb_main_receiver_name="YOUR RECEIVER NAME HERE"

# Optional configuration
var_jv_pg_fb_mute="True" # Speak with Jarvis without sound (True/False)
var_jv_pg_fb_getId="False" # Send sender ID back to user which sent a message (useful to get list of people to allow later with var_jv_pg_fb_allowed_people_ids)
