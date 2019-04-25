// CommonJS module system is built into Node
const { expmodex } = require('./expmodex')

console.log('Hello world');

// process.argv - command line arguments
//console.log(process.argv)

// Index 2 holds the first actual command line argument
let argument = process.argv[2];

console.log(expmodex(argument));