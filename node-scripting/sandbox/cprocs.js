const {
	spawn,
	exec,
	execFile
} = require('child_process');

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

/*
child_process
	spawn		spawns a new process
	spawnSync

	fork
	exec
	execFile
*/

// `exec` does not replace the existing process and uses a shell to execute the command
// `exec` spawns a shell then executes the command, buffering any generated output
exec('sh ./runme.sh');
// ...unless you pass a with callback to the method
exec('sh ./runme.sh', (error, stdout, stderr) => {
	if (error) {
		console.error(`exec error: ${error}`);
		return;
	}
	console.log(`stdout: ${stdout}`);
	console.log(`stderr: ${stderr}`);
});


// if OS != Windows - child_process.execFile() can be more efficient because it does not spawn a shell by default
// when a shell is not spawned, behaviors such as I/O redirection and file globbing are not supported

const child = execFile('node', ['--version'], (error, stdout, stderr) => {
	if (error) {
		throw error;
	}
	console.log(stdout);
});