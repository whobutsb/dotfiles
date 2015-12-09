# Bash 

### Immutable Global Variables

- Try to keep globals to a minimum 
- UPPER_CASE naming
- readonly declaration
- Use globals to replace cryptic $0, $1, etc

      readonly PROGNAME=$(basename $0)
      readonly ARGS="$@"

### Everything is local

All variables should be local

      change_owner_of_file() {
        local filename=$1
        local user=$2
        local group=$3

        chown $user:$group $filename
      }

### main()

- Help keep all variables local
- The only global command in the command: main

        main() {
          local files="/tmp/a /tmp/b"
          local i

          for i in $files
          do
          change_owner_of_file kfir users $i
          done
        }
        main

### Everything is a function 

        temporary_files() {
          local dir=$1

          ls $dir \
          | grep pid \
          | grep -v daemon
        }

        main() {
          local files=$(temporary_files /tmp)
        }

### Debugging functions

Run program with -x flag: 

        $ bash -x my_prog.sh

debug just a small section of code using set -x and set +x, which will pring debug info just for the current code wrapped

        temporary_files() {
          local dir=$1

          set -x
          ls $dir \
          | grep pid \
          | grep -v daemon
          set +x
        }

### Command line arguments

        cmdline() {
            # got this idea from here:
            # http://kirk.webfinish.com/2009/10/bash-shell-script-to-use-getopts-with-gnu-style-long-positional-parameters/
            local arg=
            for arg
            do
                local delim=""
                case "$arg" in
                    #translate --gnu-long-options to -g (short options)
                    --config)         args="${args}-c ";;
                    --pretend)        args="${args}-n ";;
                    --test)           args="${args}-t ";;
                    --help-config)    usage_config && exit 0;;
                    --help)           args="${args}-h ";;
                    --verbose)        args="${args}-v ";;
                    --debug)          args="${args}-x ";;
                    #pass through anything else
                    *) [[ "${arg:0:1}" == "-" ]] || delim="\""
                        args="${args}${delim}${arg}${delim} ";;
                esac
            done

            #Reset the positional parameters to the short options
            eval set -- $args

            while getopts "nvhxt:c:" OPTION
            do
                 case $OPTION in
                 v)
                     readonly VERBOSE=1
                     ;;
                 h)
                     usage
                     exit 0
                     ;;
                 x)
                     readonly DEBUG='-x'
                     set -x
                     ;;
                 t)
                     RUN_TESTS=$OPTARG
                     verbose VINFO "Running tests"
                     ;;
                 c)
                     readonly CONFIG_FILE=$OPTARG
                     ;;
                 n)
                     readonly PRETEND=1
                     ;;
                esac
            done

            if [[ $recursive_testing || -z $RUN_TESTS ]]; then
                [[ ! -f $CONFIG_FILE ]] \
                    && eexit "You must provide --config file"
            fi
            return 0
        }

/etc/hosts blocking and ideas

[http://someonewhocares.org/hosts/](http://someonewhocares.org/hosts/)

- [Explain Shell](http://explainshell.com)
- [Bash monitoring tips - watch & tee](https://www.youtube.com/watch?v=8zU7Ov-uW1E)
- [http://mywiki.wooledge.org/BashGuide](http://mywiki.wooledge.org/BashGuide)
- [http://bash.cyberciti.biz/guide/Main_Page](http://bash.cyberciti.biz/guide/Main_Page)
- [Defensive BASH programming](http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming)
