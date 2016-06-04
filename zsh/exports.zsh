export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL=vim
export EDITOR=vim
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin:/usr/local/aws/bin

# Kill lag when switch from normal to visual modes
export KEYTIMEOUT=1

# allow homebrew to take over for php
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# History Time Format
export HISTTIMEFORMAT="%T %d-%b-%Y "

# pip should only run if there is a virutalenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
# export PATH="/usr/local/Cellar/php55/5.5.12/bin:$PATH"