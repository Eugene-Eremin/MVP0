require('dotenv').config()

const express = require('express');
const cors = require('cors')
const cookieParser = require('cookie-parser')
const fileUpload = require('express-fileupload')
const path = require('path')

const router = require('./routes/index')
const errorMidleware = require('./middlewares/error-middleware')

const PORT = process.env.PORT || 5000

const app = express()

app.use(express.json())
app.use(cookieParser())
app.use(cors({
    credentials: true,
    origin: process.env.CLIENT_URL,
}))
// app.use(express.static(path.resolve(__dirname, 'static')))
// app.use(fileUpload({}))
app.use('/api', router)
app.use(errorMidleware)

const start = async () => {
    try {
        app.listen(PORT, () => console.log(`Server started on port ${PORT}`))
    } catch (e) {
        console.log(e)
    }
}

start()