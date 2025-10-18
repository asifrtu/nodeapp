import express from "express";

const app = express();

app.get("/user", (req:any, res: any) => {
    res.send("User data has been received from server");
});

app.get("/user/:username", (req:any, res: any) => {
    res.send(`User data has been received from server and the username is ${req.params.username}`);
});


app.listen(3000, () => {
    console.log(`Localhost is running on the port of 3000`)
});


export default app;