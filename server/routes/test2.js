const Router = require('express');
const router = new Router()

const testcontr2 = require('../controllers/testcontr2')
const testmiddle = require('../middleware/testmiddle')

router.post('/testcontr2', testmiddle, testcontr2.test)
router.get('/getFile', testmiddle, testcontr2.getFile)

module.exports = router