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

5) Get Facebook IDs of people allowed to speak with Jarvis: Try to send a message from messenger to Jarvis: It will say that you don't have right to speak to him will give you your ID.

<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-fb-messenger/master/example_no_right.png" width="250">

6) Add those IDs in the <a target="_blank" href="https://github.com/QuentinCG/jarvis-fb-messenger/blob/master/config.sh">configuration file</a> to allow people to communicate with Jarvis.

7) Enjoy


## Author
[Quentin Comte-Gaz](http://quentin.comte-gaz.com/)


## License

This project is under MIT license. This means you can use it as you want (just don't delete the plugin header).


## Contribute

If you want to add more examples or improve the plugin, just create a pull request with proper commit message and right wrapping.
