require 'yaml'

paths = YAML::load( File.open( 'config/paths.yaml' ) )

coffee_path = paths['COFFEE_DIR'] + '/.*.coffee' if paths['COFFEE_DIR']
js_path = paths['JS_DIR'] + '/.*.js' if paths['JS_DIR']
css_path = paths['CSS_DIR'] + '/.*.css' if paths['CSS_DIR']
less_path = paths['LESS_DIR'] + '/.*.less' if paths['LESS_DIR']

# more complicated matching than wildcard must be legit regexp
directives_js = Regexp.new(eval('/'+paths['DIRECTIVES_DIR']+'\/([^\/]*)\.js/'))
directives_css = Regexp.new(eval('/'+paths['DIRECTIVES_DIR']+'\/([^\/]*)\.css/'))


###
# watch source files for changes
watch coffee_path do system 'rake js' end

watch js_path do system 'rake js' end

watch css_path do system 'rake css' end

watch less_path do system 'rake css' end

###
# watch directive files for changes
watch directives_js do system 'rake js' end

watch directives_css do system 'rake css' end