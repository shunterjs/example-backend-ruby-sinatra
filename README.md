
# Example Shunter Application Back End (Ruby, Sinatra)

A Ruby and Sinatra-based back end for the [Shunter example application](https://github.com/shunterjs/example).


## Requirements

With [Bundler](http://bundler.io/)

`Ruby 2.1.2+`

Without Bundler

`Ruby 1.9.3+`

## Installation

With [Bundler](http://bundler.io/)

```
cp .ruby-version.sample .ruby-version
gem install bundler
bundle
```

Without Bundler

```
cp .ruby-version.sample .ruby-version
gem install sinatra
```

If you are not using Bundler, to start the app with [Foreman](https://github.com/ddollar/foreman) you will also need Foreman

```
gem install foreman
```

## Running

To start the application on port `5000`:

```
ruby app.rb
```

To start the application on a different port:

```
PORT=1234 ruby app.rb
```

To start the application with [Foreman](https://github.com/ddollar/foreman) on port `5000`:

```
foreman start
```

## License

Copyright 2016, licensed under the [Lesser General Public License (LGPL-3.0)](http://www.gnu.org/licenses/lgpl-3.0.txt).