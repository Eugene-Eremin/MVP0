const prisma = require('../prisma/prisma-client')
const jwt = require('jsonwebtoken')

class TokenService {
    generateTokens(payload) {
        const accessToken = jwt.sign(payload, process.env.JWT_ACCESS_SECRET, { expiresIn: '30m' })
        const refreshToken = jwt.sign(payload, process.env.JWT_REFRESH_SECRET, { expiresIn: '30d' })
        return {
            accessToken,
            refreshToken,
        }
    }

    validateAccessToken(token) {
        try {
            const userData = jwt.verify(token, process.env.JWT_ACCESS_SECRET)
            return userData
        } catch (e) {
            return null
        }
    }

    validateRefreshToken(token) {
        try {
            const userData = jwt.verify(token, process.env.JWT_REFRESH_SECRET)
            return userData
        } catch (e) {
            return null
        }
    }

    async saveToken(userId, refreshToken) {
        // const tokenData = await tokenModel.findOne({user: userId})
        const tokenData = await prisma.tokens.findUnique({
            where: {
                userId
            }
        })
        if (tokenData) {
            const tokenData = await prisma.tokens.update({
                where: {
                    userId
                },
                data: {
                    refreshToken
                }
            })
            return tokenData
        }
        // const token = await tokenModel.create({ user: userId, refreshToken })
        const token = await prisma.tokens.create({
            data: {
                userId,
                refreshToken
            }
        })
        return token;
    }

    async removeToken(refreshToken) {
        // const tokenData = await tokenModel.deleteOne({ refreshToken })
        const tokenData = await prisma.tokens.delete({
            where: {
                refreshToken
            }
        })
        return tokenData
    }

    async findToken(refreshToken) {
        // const tokenData = await tokenModel.findOne({ refreshToken })
        const tokenData = await prisma.tokens.findUnique({
            where: {
                refreshToken
            }
        })
        return tokenData
    }
}

module.exports = new TokenService()