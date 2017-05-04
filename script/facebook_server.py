#!/usr/bin/env python

import argparse # Manage program arguments
import json # Read json input
import os # Build path
import sys # Use exit calls
import signal # Catch kill
from subprocess import check_output # Run shell commands
import logging # Add logging
import fbchat # Use facebook messenger library
import unicodedata # Normalized string
import ast

class JarvisFacebookMessengerServer(fbchat.Client):
  def __init__(self, email, password, verbose=True, mute=True, getId=False, allowAll=True, allowedIdList = []):
    logging.debug("Initializing Facebook messenger server with email '{}', getId='{}', verbose='{}',  mute='{}', allowAll='{}' and allowedList='{}'.".format(str(email), str(getId), str(verbose), str(mute), str(allowAll), str(allowedIdList)))

    # Launch the Facebook messenger server
    try:
      fbchat.Client.__init__(self, email, password, verbose)
    except Exception:
      logging.error("Login failed, check email/password.")

    # Define the command line base to communicate with Jarvis with JSON
    self.program = [os.path.join(".", "jarvis.sh"), "-j"]
    #self.program = [os.path.join(str("."), str("/home/quecg/jarvis/jarvis.sh")), str("-j")]

    # Initialize verbose and muted options
    self.mute_mode = mute
    self.verbose_mode = verbose
    self.getId = getId
    self.allowAll = allowAll
    self.allowedIdList = allowedIdList

  def _exec(self, args):
    # Send command to Jarvis
    flags = []
    if self.mute_mode:
      flags.append(str("-m"))
    if self.verbose_mode:
      flags.append(str("-v"))

    command = self.program + flags + args

    logging.debug("Sending command '{}' to Jarvis.".format(str(command)))

    return check_output(command)

  def executeOrder(self, phrase):
    # Say something to Jarvis

    # Don't send empty order to Jarvis (useless and risky)
    if phrase == "":
      return list()

    # Send order to Jarvis
    return list(json.loads(self._exec([str("-x"), str(phrase)]).decode('utf-8'), strict=False))

  def properExit(self, signum, frame):
    # Exit the class properly
    print("Stopping Jarvis Facebook Messenger server.")
    self.stop_listening()
    sys.exit(0)

  def on_message(self, mid, author_id, author_name, message, metadata):
    # If the author is not this class, send request to Jarvis...
    if str(author_id) != str(self.uid):
      # Mark message as delivered
      self.markAsDelivered(author_id, mid)

      # Mark message as read
      self.markAsRead(author_id)

      # Be sure that the author is allowed
      if not self.allowAll:
        if not (str(author_id) in self.allowedIdList):
          self.send(author_id, "You don't have right to speak to Jarvis! (Your ID is {})".format(str(author_id)))
          logging.warning("Not allowed user '{}' tried to speak to Jarvis.".format(str(author_id)))
          return

      # Be sure to have a normalized string to send to Jarvis
      message = unicodedata.normalize('NFKD', message).encode('ascii','ignore').decode('utf-8')

      logging.debug("Received message from '{}' (ID '{}'): '{}'.".format(str(author_name), str(author_id), str(message)))

      # Send request to Jarvis and receive answer
      response = self.executeOrder(str(message))
      logging.debug("Response from Jarvis: '{}'.".format(str(response)))

      # ... and respond to user with Jarvis response
      try:
        for json_dict in list(response):
          for key, value in json_dict.items():
            # Send Jarvis response to the sender
            if self.verbose_mode:
              self.send(author_id, "{}: {}".format(str(key), str(value)))
            else:
              self.send(author_id, str(value))
      except ValueError:
        self.send(author_id, "Can't parse Jarvis response: '{}'".format(str(response)))

      # Send the ID of the caller to himself if requested
      if self.getId:
        self.send(author_id, "Your ID is '{}'".format(str(author_id)))

if __name__ == "__main__":
  # Define lambda function to convert string to bool
  def __str2bool(value):
    if value.lower() in ('yes', 'true', 't', 'y', '1'):
      return True
    if value.lower() in ('no', 'false', 'f', 'n', '0'):
      return False
    else:
      raise argparse.ArgumentTypeError('Boolean value expected.')

  # Parse received parameters
  parser = argparse.ArgumentParser(description='Jarvis Facebook Messenger Server')
  parser.add_argument('-e', '--email', help='Facebook email used as username')
  parser.add_argument('-p', '--password', help='Facebook password')
  parser.add_argument('-v', '--verbose', type=__str2bool, nargs='?', default="True", help='Show debug information (default: True)')
  parser.add_argument('-m', '--mute', type=__str2bool, nargs='?', default="True", help='Mute Jarvis (default: True)')
  parser.add_argument('-i', '--getId', type=__str2bool, nargs='?', default="False", help='Get ID of the sender (default: False)')
  parser.add_argument('-a', '--allowAll', type=__str2bool, nargs='?', default="True", help='Allow all people to send request to Jarvis with messenger (default: True)')
  parser.add_argument('-l', '--allowedIdList', default="[]", help='Allowed list of IDs to send request to Jarvis (default: [])')
  args = parser.parse_args()

  # Show more information if in debug mode
  if args.verbose:
    logger = logging.getLogger()
    logger.setLevel(logging.DEBUG)

  # Create a Jarvis-Facebook messenger server instance
  jarvis_fb_server = JarvisFacebookMessengerServer(email = args.email,
                                                   password = args.password,
                                                   verbose = args.verbose,
                                                   mute = args.mute,
                                                   getId = args.getId,
                                                   allowAll = args.allowAll,
                                                   allowedIdList = ast.literal_eval(args.allowedIdList))

  # Add signals catching to quit application when jarvis ends
  for sig in [signal.SIGTERM, signal.SIGINT, signal.SIGHUP, signal.SIGQUIT]:
    signal.signal(sig, jarvis_fb_server.properExit)

  # Listen facebook messenger message forever (until jarvis ends)
  jarvis_fb_server.listen()
