name             'reviewboard'
maintainer       'Fumihiro Ito'
maintainer_email 'fmhrit@gmail.com'
license          'All rights reserved'
description      'Installs/Configures reviewboard'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'fedora'

depends 'mysql'
depends 'apache'
depends 'memcached'
depends 'virtualenv'
