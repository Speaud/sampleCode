#Barebones Node Express Hello World App

Note: This assumes you have a stable Node(v8+) and Docker(v18+) instance installed

Install dependencies
`npm i`

Start the app
`node index.js`

You can now view the app in a browser/web-client at localhost:3000

Build and tag the docker image
`docker build -t barebones_node_express_hello_world .`

Run the image and map a local port to the exposed image port
`docker run -p 49160:3000 -d barebones_node_express_hello_world`

List running images (obtain CONTAINER ID)
`docker ps`

Stop the running image
`docker kill <CONTAINER ID>`