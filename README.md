# Icic
[![Gem Version](https://img.shields.io/gem/v/icic.svg)](http://rubygems.org/gems/icic)

`icic` is a tool to simplify the generation of iOS and Android image asset from an image file. For Android, this tool will generate & classify image based on the dpi. For iOS this tool will create 1x, 2x, 3x and also `filename.imageset` metadata file.

## Requirements

This tool rely on ImageMagick or GraphicsMagick so make sure this tools already installed. You can check if you have it installed by running

```
$ convert -version
Version: ImageMagick 7.0.7-7 Q16 x86_64 2017-10-08 http://www.imagemagick.org
Copyright: © 1999-2017 ImageMagick Studio LLC
License: http://www.imagemagick.org/script/license.php
Features: Cipher DPC HDRI Modules
Delegates (built-in): bzlib freetype jng jpeg ltdl lzma png tiff xml zlib
```

## Installation

Install this tool using `rubygem`

    gem install icic

## Usage

Run on terminal
	
	icic

Then it will prompt for
- The original image file (that will be converted)
- The platform (iOS or Android)
- The name of generated file
- The output folder

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidrodixtion/icic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Icic project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hidrodixtion/icic/blob/master/CODE_OF_CONDUCT.md).
