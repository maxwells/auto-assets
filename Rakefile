require 'yaml'
require 'sprockets'
require 'jsmin'

########
# Config

ROOT = Pathname(File.dirname(__FILE__))

sprockets = Sprockets::Environment.new ROOT do |env|
  env.logger = Logger.new STDOUT # log to console
end

# let sprockets know where to look
paths = YAML::load( File.open( 'config/paths.yaml' ) )
for key in paths.keys
  sprockets.append_path paths[key] if key != 'ASSETS_DIR'
end

ASSETS_PATH    = ROOT.join paths['ASSETS_DIR']
CSS_DIRECTIVES = []
JS_DIRECTIVES  = []

Dir.foreach(paths['DIRECTIVES_DIR']) do |f|
  JS_DIRECTIVES  << f if /\.js/.match f
  CSS_DIRECTIVES << f if /\.css/.match f
end

########
# Watch
# Starts watchr. Watchr tells the asset tasks
# below to concatenate files according to
# your directive files as they are changed.
# Watchr will only start if it is not already running.
task :watch do
  system "(ps |grep 'assets.watchr' |grep -v grep) || (watchr config/assets.watchr &)"
end

# Unwatch kills watchr
task :unwatch do
  system "kill `ps |grep 'assets.watchr' |grep -v grep |awk '{print $1}'`"
end

########
# CSS
# Compiles LESS & concatenates w/ CSS

task :css do
  CSS_DIRECTIVES.each do |f|
    fpath = ASSETS_PATH.join f
    fout = File.open fpath, 'w'
    fout.write sprockets[f].to_s
    fout.close
  end
end

########
# JS
# Compiles CoffeeScript & concatenates w/ JS

task :js do
  JS_DIRECTIVES.each do |f|
    fpath = ASSETS_PATH.join f
    fout = File.open fpath, 'w'
    fout.write sprockets[f].to_s
    fout.close
  end
end

#########
# Compile
# Static compilation of JS/CSS assets.
# Will output minifed js files with [name].min.js

task :compile => [:css, :js] do
  JS_DIRECTIVES.each do |f|
    fpath = ASSETS_PATH.join f.split('.')[0] + '.min.js'
    fout = File.open fpath, 'w'
    fout.write JSMin.minify sprockets[f].to_s
    fout.close
  end
end