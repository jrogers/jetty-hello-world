### Install stuff
```
brew cask install caskroom/versions/java8 # will require password
brew install maven
```

### In source directory

```
mvn package
docker build -t whatever/whatever .
```

### To run
`docker run -p 8080:8080 -p 9910:9910 whatever/whatever`

This will expose a web server on 0.0.0.0:8080 that will just spit out "Hello World".

To attach to JMX, you can do `jconsole` and then use Remote Process`localhost:9910` to connect.
