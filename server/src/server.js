import app from "./app.js"

const PORT = process.env.port || 3000;

app.listen(PORT, () => {
	console.log(`Last Match API listening on port ${PORT}`);
});