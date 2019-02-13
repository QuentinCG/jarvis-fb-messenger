## Description
Speak with <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a> using <a target="_blank" href="https://messenger.com/">Facebook Messenger app</a> or <a target="_blank" href="https://www.facebook.com/">facebook website</a>.

<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-fb-messenger/master/presentation.png" width="150">


## Usage

### Used as a normal chat app

You can use this plugin to communicate with <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a> with <a target="_blank" href="https://messenger.com/">Facebook Messenger app</a> or directly with <a target="_blank" href="https://www.facebook.com/">facebook website</a>.:

<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-fb-messenger/master/example_base.png" width="500">


### Used to send message and image to facebook user

```
(English)
You: Send a facebook message to XXXX
Jarvis: Facebook message sent to XXXX

(French)
You: Envoi un message facebook à XXXX
Jarvis: Message facebook envoyé à XXXX
```


<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-fb-messenger/master/example_send_message.png" width="250">


## How to install

1) Create a <a target="_blank" href="https://www.facebook.com/">Facebook account</a> which will be used as "sender" for your Jarvis communications.

2) Add this facebook account as friend to your main facebook account (the one you daily use).

3) Add this plugin to your <a target="_blank" href="http://domotiquefacile.fr/jarvis/">Jarvis assistant</a> (<a target="_blank" href="http://domotiquefacile.fr/jarvis/content/plugins">more info here</a>): ```./jarvis.sh -p https://github.com/QuentinCG/jarvis-fb-messenger``` (the installation may take up to 35 minutes).

4) Configure the <a target="_blank" href="https://github.com/QuentinCG/jarvis-fb-messenger/blob/master/config.sh">configuration file</a> to match your requirements: You need to specify your facebook Jarvis email address, password and some other options (don't specify user IDs yet).

5) Get Facebook IDs of people allowed to speak with Jarvis: Try to send a message from messenger to Jarvis (Jarvis must be launched): It will say that you don't have right to speak to him and will give you your ID.

<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-fb-messenger/master/example_no_right.png" width="250">

6) Add those IDs in `var_jv_pg_fb_allowed_people_ids` in the <a target="_blank" href="https://github.com/QuentinCG/jarvis-fb-messenger/blob/master/config.sh">configuration file</a> to allow people to communicate with Jarvis.

7) For more security once the plugin is working: Update the <a target="_blank" href="https://github.com/QuentinCG/jarvis-fb-messenger/blob/master/config.sh">configuration file</a> to set `var_jv_pg_fb_getId` and `var_jv_pg_fb_allow_control_to_all` to `False`

8) Enjoy




IMPORTANT NOTE:

Facebook will more than likely flag your account as "bot". To prevent it, you should log in with your jarvis facebook account using a web browser at the same IP (and same device if possible) in order for facebook to "register" that you are not a bot.
To do so, you can for example use chromium as web browser (X server must be activated if you are on SSH):
```
sudo apt install chromium chromium-l10n
chromium
```

## Help

If you have difficulties making this plugin work, here are some advice:
 - Be sure Jarvis is launched else it will not answer your request.
 - Be sure you followed the install properly (ALL points are important, check your <a target="_blank" href="https://github.com/QuentinCG/jarvis-fb-messenger/blob/master/config.sh">configuration file</a> if you have a doubt)
 - Be sure your Facebook account is validated (and you clicked the link in the validation email sent by facebook)
 - Try to discuss from one account to the other with web browsers to be absolutely sure they are working fine
 - If this plugin worked and is not working anymore, it is maybe because Facebook locked your account because it thinks you are a bot. You'll have to follow their request to re-activate your account to prove you are not a bot (add a picture of you is the most common request from facebook)
 - If this plugin worked and is not working anymore, it is possible the library used to communicate to facebook is obsolete. Try to uninstall and reinstall the plugin or run the `sudo pip3 install fbchat --upgrade` command
 - Maybe your facebook Id is not valid ? Put the `var_jv_pg_fb_allow_control_to_all` key in the <a target="_blank" href="https://github.com/QuentinCG/jarvis-fb-messenger/blob/master/config.sh">configuration file</a> to `False` and try to communicate with Jarvis from your Web browser (Put it back to `True` once you discovered from where the issue came from else everyone will be able to discuss with your Jarvis).
 - Check the Jarvis logs to better understand what is not working properly.
 - If you don't see all the response when you do a request: You are not using Jarvis properly, be sure the response from a request to Jarvis is one and not multiple ones. To check, how Jarvis is working: `jarvis -j -m -v "My question that is not working with FB here"`.


## Author
[Quentin Comte-Gaz](http://quentin.comte-gaz.com/)


## License

This project is under MIT license. This means you can use it as you want (just don't delete the plugin header).


## Contribute

If you want to add more examples or improve the plugin, just create a pull request with proper commit message and right wrapping.
