const path = require('path');
const {
	spawn,
	exec,
	execFile
} = require('child_process');

/*

	the `child_process` module - https://nodejs.org/api/child_process.html
	
		`child_process.spawn()` (<- runs async) and `child_process.spawnSync()` - primary functionality provider

		pipes between parent process and the spawned child
			stdin
			stdout
			stderr

			@note pipes have limited (and platform-specific) capacity

		spawned Node.js child processes are independent of the parent with exception of the IPC communication channel
	
		each process has its own memory (standalone v8 instance)
	
			@note spawning a large number of child Node.js processes is not recommended

		methods:
			spawn			spawns a new child process (async) from command
			exec			spawns a shell then `spawn` within that shell
			execFile		spawns the command directly without first spawning a shell
			fork			spawns a new Node.js process and invokes a specified module with inter-process communication (IPC) channel
			spawnSync		
			execSync
			execFileSync
*/

/* `spawn` - child_process.spawn(command[, args][, options])
************************************************************/

const ls = spawn('ls', ['-lh', '/usr']);

ls.stdout.on('data', (data) => {
	console.log(`stdout: ${data}`);
});

ls.stderr.on('data', (data) => {
	console.log(`stderr: ${data}`);
});

ls.on('close', (code) => {
	console.log(`child process exited with code ${code}`);
});

/* `exec` - child_process.exec(command[, options][, callback])

	does not replace the existing process and uses a shell to execute the command

	spawns a shell then executes the command, buffering any generated output

	...unless you pass a with callback to the method

************************************************************/

exec('sh runme.sh', { env: { foo: 'bar' } }, (error, stdout, stderr) => {
//exec('node runme', { env: { foo: 'bar' } }, (error, stdout, stderr) => {
	if (error) {
		console.error(`exec error: ${error}`);
		return;
	}
	console.log(`stdout: ${stdout}`);
	console.log(`stderr: ${stderr}`);
});

/* `execFile`

	spawns the command directly without first spawning a shell

************************************************************/

// if OS != Windows - child_process.execFile() can be more efficient because it does not spawn a shell by default
// when a shell is not spawned, behaviors such as I/O redirection and file globbing are not supported
/*
const child = execFile('node', ['--version'], (error, stdout, stderr) => {
	if (error) {
		throw error;
	}
	console.log(stdout);
});
*/
/* `fork`

	spawns a new Node.js process and invokes a specified module with an IPC communication channel
	the returned ChildProcess will have an additional communication channel built-in

	subprocess.send()

	does not clone the current process
	
************************************************************/


/* `execSync`
************************************************************/


/* `execFileSync`
************************************************************/
