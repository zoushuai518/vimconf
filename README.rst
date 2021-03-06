vimconf
=======

A Vim configuration which supports plugin loading as per file type.

Installation
------------

*NOTE*: If you are using Vim on Windows, please install Cygwin.

1. Check out from github::

    git clone git://github.com/hzheng/vimconf.git
    OR:
    git clone https://github.com/hzheng/vimconf.git

    cd vimconf

2. Install submodules::

    sh/install-submodules.sh

3. Install Vim configuration::

    sh/install-configs.sh

Troubleshooting
---------------

- Problems in submodule installation

    + *Error* on cloning submodule(or submodule's submoudle)::

        Permission denied (publickey)

      *Solution*:
      
        Some submodules may require you to set up SSH for GitHub, for more
        information, please refer to
        `github help <http://help.github.com/mac-set-up-git/>`_.


    + If some submodules cannot be downloaded for the moment, you can continue
      to install Vim configuration and retry downloading later.

    + *Error* on installing command-t::
 
        ruby: command not found

      *Solution*:

        install ruby

    + *Error* on installing command-t::

        extconf.rb:24:in `require': no such file to load -- mkmf (LoadError)

      *Solution*:
        
        install ruby-dev

Reference
---------

- `The ultimate vim config <https://github.com/spf13/spf13-vim>`_

- `Turning Vim into a modern Python IDE <http://sontek.net/turning-vim-into-a-modern-python-ide>`_

