console.log('process.env:', process.env)

process.on('message', (m) => {
	console.log('CHILD got message:', m);

	process.exit(1);
});

// Causes the parent to print: PARENT got message: { foo: 'bar', baz: null }
process.send({ foo: 'bar', baz: NaN });
