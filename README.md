# Auto-assets

Auto-assets is a Sprockets recipe that serves as a JavaScript, CoffeeScript, CSS & LESS asset pipeline. When properly configured, any js/coffee/less/css files you update will automatically compile and be packaged into bundles that you specify, which greatly reduces the overhead associated with multi file download when loading your webpage. It requires that you run Ruby on your machine, but is designed to fit into whatever framework you may be using for development. Also, static compilation and JS minification are built in so that you can use the same setup on your production machine.

## Installation

There are a few short steps to configuration

1) install the provided Rakefile and Gemfile into the root of your application, and `bundle install`. If you do not have bundler, `gem install bundler`. If you do not have ruby, get it.

2) install config/assets.watchr and config/paths.yaml to wherever you feel they fit best in your application. Be sure to adjust the relative path for paths.yaml in both the Rakefile and the assets.watchr file.

3) edit paths.yaml to reflect your application setup. `ASSETS_DIR` is where the compiled and minified files will end up. `DIRECTIVES_DIR` is where your sprockets directive files will live ([more info](https://github.com/sstephenson/sprockets#the-directive-processor)). The other paths are pretty straight forward: list their paths relative to application root.

4) cd to your application root and `rake watch`. This should start watchr (in the background), which will call `rake js` or `rake css` whenever any changes are made to your directives or any of your source files that your paths.yaml points to.

Notes: minification is not currently triggered by changes in your file system, you have to manually call it with `rake compile`. Also, using `rake watch` will start watching the file system in the background -- it will ensure you only run one watchr process at a time (so odd stuff won't happen). `rake unwatch` kills it.