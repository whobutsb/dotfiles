# Python

## Virtualenv

*Description from* [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup#virtualenv)

[Virtualenv](www.virtualenv.org) is a tool that creates an isolated Python environment for each of your projects. For a particular project, instead of installing required packages globally, it is best to install them in an isolated folder in the project (say a folder named venv), that will be managed by virtualenv.

The advantage is that different projects might require different versions of packages, and it would be hard to manage that if you install packages globally. It also allows you to keep your global /usr/local/lib/python2.7/site-packages folder clean.

### Usage
Let's say you have a project in a directory called myproject. To set up virtualenv for that project:

    $ cd myproject/
    $ virtualenv venv --distribute

If you want your virtualenv to also inherit globally installed packages (like IPython or Numpy mentioned above), use:

    $ virtualenv venv --distribute --system-site-packages

These commands create a venv subdirectory in your project where everything is installed. You need to activate it first though (in every terminal where you are working on your project):

    $ source venv/bin/activate

You should see a (venv) appear at the beginning of your terminal prompt indicating that you are working inside the virtualenv. Now when you install something:

    $ pip install <package>

It will get installed in the venv folder, and not conflict with other projects.

**Important**: Remember to add `venv` to your project's `.gitignore` file so you don't include all of that in your source code!

## Virtualenvwrapper

*Description from* [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup#virtualenvwrapper)

[Virtualenvwrapper](https://virtualenvwrapper.readthedocs.org/en/latest/) is a set of extensions that includes wrappers for creating and deleting virtual environments and otherwise managing your development workflow, making it easier to work on more than one project at a time without introducing conflicts in their dependencies.

Main features include:

- Organizes all of your virtual environments in one place.
- Wrappers for managing your virtual environments (create, delete, copy).
- Use a single command to switch between environments.
- Tab completion for commands that take a virtual environment as argument.

### Usage

Create a new virtual environment. When you create a new environment it automatically becomes the active environment:

    $ mkvirtualenv [env name]

Remove an existing virtual environment. The environment must be deactivated (see below) before it can be removed:

    $ rmvirtualenv [env name]

Activate a virtual environment. Will also list all existing virtual environments if no argument is passed:

    $ workon [env name]

Deactivate the currently active virtual environment. Note that workonwill automatically deactivate the current environment before activating a new one:

    $ deactivate




