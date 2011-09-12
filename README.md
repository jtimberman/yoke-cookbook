Description
===========

Installs [Yoke](http://cziko.github.com/yoke/).

Requirements
============

## Platform:

Mac OS X. Should work on any version?

Attributes
==========

* `node['yoke']['install']` - The Yoke version to install. Default 'ruby'. Values can be one of: php, python, ruby, node or all.

Usage
=====

The default recipe will install the Ruby service. You can override this with the `node['yoke']['install']` attribute. See __Caveats__ below.

Caveats
-------

While Node is available to install, the recipe doesn't do the additional shell magic required to make it work. Manual steps may be necessary.

With the default hotkey, the Ruby service was failing to run. This is probably a bug upstream.

The recipe doesn't set any keyboard shortcuts automatically. The user defaults on OS X doesn't really make it easy to set shortcuts for Text services.

License and Author
==================

Copyright:: 2011, Joshua Timberman <cookbooks@housepub.org>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
