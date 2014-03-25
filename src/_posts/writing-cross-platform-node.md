{
  "layout": "post",
  "title": "Writing cross-platform Node.js",
  "date": "Tue Mar 25 2014 11:53:07 GMT+0000 (GMT)",
  "description": "A major strength of Node.js is great cross-platform support. With a little effort you can make sure your code will run on Windows, Linux and OSX.",
  "tags": [
    "Node.js"
  ]
}

## Cross-platform if you want

Node.js is cross-platform meaning it works on Windows, OSX and Linux. A large number of the Node.js community write Node.js on OSX and then deploy to Linux servers. Because OSX and Linux are based on UNIX this tends to just work. Windows support is a first-class citizen in Node.js and if you learn to use Node.js in the right way you can make sure that you can welcome your Windows friends to your code party.

## Paths

The biggest issue you will run into is paths. Node.js does a great job of taking care of most of this for you but if you build paths in the wrong way you'll run into problems on Windows.

Consider you are doing some string concatantion to build a path for example.

    var foo = 'foo';
    var bar = 'bar';
    var filePath = foo + '/' + bar + '/';

This will work fine on OSX and Linux but not on Windows where \ is expected. This is the wrong way to do it.

The [path][1] module gives you all of the tools you need to handle cross-platform paths. For this example we need `path.join`.

    var filePath = path.join(foo, bar);
    // 'foo/bar' on OSX and Linux
    // 'foo\\bar' on Windows

## Use `path.resolve` to traverse the filesystem

Using `path.resolve` lets you move around the file system but maintain cross platform compatibility. As per the documentation you can think of it as a series of `cd` commands that output a single path at the end.

    path.resolve('../', '/../', '../')
    // '/home' on Linux
    // '/Users' on OSX
    // 'C:\\Users' on Windows

## Use `path.normalize` to create reliable paths

If you find yourself doing things like this

    var filePath = '/home/george/../folder/code';

You should be using `path.normalize`. This will present you with the correct path on whatever platform you are using.

    var filePath = path.normalize('/home/george/../folder/code'); 
    // '/home/folder/code'

## Use `path.join` to join folder names

As we saw before with the string concatenation example kittens can die if you use string concatenation.

If you need to join paths together use `path.join`. This will also normalize the result for you.

    path.join('foo', '..', 'bar', 'baz/foo');
    // 'bar/baz/foo' on OSX and Linux
    // 'bar\\baz\\foo' on Windows

## Scripts in package.json

Let's say you have the following executable script `npm-postinstall` in the bin folder of your project. 

    #!/usr/bin/env node
    console.log('node modules installed!');

If you define scripts to be run in your package.json you will find that Windows will choke if you use `./` and rely on a Node.js shebang.

    {
      "name": "some-app",
      "version": "0.0.1",
      "authors": [
        "George Ornbo <george@shapeshed.com>",
      ],
      "scripts": {
        "postinstall": "./bin/npm-postinstall"
      }
    }

The solution is to use the node executable.

    {
      "name": "some-app",
      "version": "0.0.1",
      "authors": [
        "George Ornbo <george@shapeshed.com>",
      ],
      "scripts": {
        "postinstall": "node bin/npm-postinstall"
      }
    }

This works for all platforms rather than just OSX and Linux.

## Join shell commands with a double ampersand instead of a semi-colon

If you are working with any form of executing command-line programs, and you like to execute more than one in a single go, you would probably do so like this (let's use the basic act of creating a folder and cd'ing into it for brevity):

    shell.exec('mkdir folder_name; cd folder_name');
    
Unfortunately, that does not work on Windows. Instead, use this:

    shell.exec('mkdir folder_name && cd folder_name');

## Use the os module for more control

If you need even more control you can get the platform you are running on react accordingly with the [os module][3].

    var os = require('os');
    os.platform();
    // 'linux' on Linux
    // 'win32' on Windows 32-bit
    // 'win64' on Windows 64-bit
    // 'darwin' on OSX

## Conclusion

One of the major strengths of Node.js is the ability to deploy your code on any platform and to work with almost any development platform. With a bit of knowledge you can make cross-platform compatibility happen out of the box and avoid having to write the 'make x compatible on x' ticket.

## References

* [Core path module][1]
* [Core os module][3]
* [Windows and Node: Writing Portable Code][2]

[1]: http://nodejs.org/api/path.html
[2]: http://dailyjs.com/2012/05/24/windows-and-node-4/
[3]: http://nodejs.org/api/os.html
