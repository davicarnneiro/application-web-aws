const express = require('express')
const app = express()
const port = 8080

app.get("/", function(req, res){
  res.sendFile(__dirname + "/index.html");
});

app.listen(port, () => {
  console.log(`Aplicação sendo executada na porta ${port}`)
})

