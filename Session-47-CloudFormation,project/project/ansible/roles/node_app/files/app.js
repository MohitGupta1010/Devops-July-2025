const express=require('express');
const port=3000;
const app= express();

app.get('/',(req,res)=>{
    res.send('Node App is Running')
})
app.get('/load',(req,res)=>{
    let start= Date.now();
    while(Date.now() - start < 5000) {} //CPU load
    res.send('CPU Load Generated')
})
app.listen(port, '0.0.0.0', () => console.log(`Server started on port ${port}`));

//  tasks/main.yml
// install nodejs npm
// create nodejs service
// start service

// check in browser
// public_ip:3000
// public_ip:3000/load 

// observe node exporte metrics 