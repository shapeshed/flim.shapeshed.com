# shapeshed.com 

[![Build Status](https://travis-ci.org/shapeshed/shapeshed.com.png?branch=master)](https://travis-ci.org/shapeshed/shapeshed.com)

This is the source code for [shapeshed.com](http://shapeshed.com).

The site is built on [flim](https://github.com/shapeshed/flim), a static site generator.

## Installation

    npm install

## Site generation

    make build

## Deployment

    make deploy

## OSX specific notes

If you are on OSX the `Makefile` uses GNU sed and GNU md5sum. To install these on a Mac do

    brew install --default-names gnu-sed
    brew install md5sha1sum
