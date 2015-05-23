REPORTER = dot

run: compile mocha
.PHONY: run

compile: 
	babel -d lib/ src/

mocha:
	@NODE_ENV=test ./node_modules/mocha/bin/mocha --harmony\
		--reporter $(REPORTER) \
		--require coffee-script/register \
		--compilers coffee:coffee-script/register \
		test/*.coffee

test-cov:
	@NODE_ENV=test node node_modules/istanbul/lib/cli.js cover -x '**/examples/**' \
		./node_modules/mocha/bin/_mocha test/*.coffee -- \
		--reporter $(REPORTER) \
		--require coffee-script/register \
		test/*.coffee \
