# Weechat 

Changing windows: 

	alt+arrow keys

### Ignoring 

Ignore a user on a specific server and channel

	/ignore iadd <user> freenode <#channel> 

View the ignore list

	/ignore list

Delete and entry in the ignore list

	/ignore del #

Delete everyone on the ignore list

	/ignore del -all

### Filtering

To hide every join/part/quit message everywhere

	/filter add partquit * irc_join,irc_part,irc_quit * 

__Links__

- [Introduction to Weechat](http://thepracticalsysadmin.com/introduction-to-weechat/)
