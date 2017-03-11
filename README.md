# Basic Template

A basic vapor template for starting a new Vapor web application. If you're using vapor toolbox, you can use: `vapor new --template=basic`

## 📖 Documentation

Visit the Vapor web framework's [documentation](http://docs.vapor.codes) for instructions on how to use this package.

## 💧 Community

Join the welcoming community of fellow Vapor developers in [slack](http://vapor.team).

## 🔧 Compatibility

This package has been tested on macOS and Ubuntu.

## Getting started

You'll need to have postgres installed ahead of time, and have created the appropriate database.  On Linux

```sh
$ sudo apt-get install postgresql postgresql-contrib libpq-dev
$ sudo -u postgres -i
postgres@$HOSTNAME:~$ createdb witfight
postgres@$HOSTnAME:~$ createdb $USERNAME
```

Then, update the secrets file to match, inserting $USERNAME in the user field of
`postgres@$HOSTNAME:~$ createdb witfight`

To start the server, run

```sh
$ swift build
$ vapor build
$ vapor run serve
```

Then navigate to http://localhost:8080
