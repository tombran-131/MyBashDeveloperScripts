const Express = require('express');

const app = Express();
const port = 3000;

app.use(Express.static('./client/dist'));

app.get('/', (req, res) => {
  res.send('Hello World!')
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
});

