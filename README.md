# natives

Installs native library packages required by Ruby gems (normally with native extensions) on your machine. 

It uses multi-platform catalogs maintained by [natives-catalog](https://github.com/teohm/natives-catalog) project.

## Install

```
gem install natives
```

## Run
``` 
natives install curb capybara-webkit nokogiri sqlite3
```
It will try to install native packages required by the following gems: curb, capybara-webkit, nokogiri, sqlite.


## Catalogs

### System-wide

By default, it uses the catalogs shipped with [natives-catalog](https://github.com/teohm/natives-catalog) gem.

To update the catalogs:

```
gem update natives-catalog
```

### Project-specific

It also looks for a `natives-catalog` directory in current working directory, and loads any YAML catalog files in the directory.



## Contributing to natives

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Huiming Teo. See LICENSE.txt for
further details.

