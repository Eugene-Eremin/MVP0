const ApiError = require('../error/api-error');

class testcontr1 {
    async test(req, res, next) {
        try {
            return res.json("test1 hello")
        } catch (e) {
            return next(ApiError.badRequest(e.message));
        }
    }
}

module.exports = new testcontr1()