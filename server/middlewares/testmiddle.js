module.exports = function (req, res, next) {
    next()
    return res.json('доступ отказан')
}