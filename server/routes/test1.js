const Router = require('express');
const router = new Router()

const testcontr1 = require('../controllers/testcontr1')
const testmiddle = require('../middleware/testmiddle')

router.get('/testcontr1', testmiddle, testcontr1.test)

module.exports = router