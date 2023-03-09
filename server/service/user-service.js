const prisma = require('../prisma/prisma-client')
const bcrypt = require('bcrypt')
const uuid = require('uuid')
const mailService = require('./mail-service')
const tokenService = require('./token-service')
const UserDto = require('../dtos/user-dto')
const ApiError = require('../error/api-error')

class UserService {
    async registration(email, password) {
        const candidate = await prisma.users.findUnique({ where: { email } })
        if (candidate) throw ApiError.BadRequest(`Пользователь с почтовым адресом ${email} уже существует`)

        const hashedPassword = await bcrypt.hash(password, 3);
        const activationLink = uuid.v4();

        const user = await prisma.users.create({
            data: {
                email,
                hashedPassword,
                emailActivation: {
                    create: {
                        activationLink
                    }
                }
            },
            select: {
                id: true,
                email: true,
                phoneNumber: true,
                phoneNumber: true,
                emailActivation: {
                    select: {
                        isEmailActivated: true
                    }
                },
                phoneNumberActivation: {
                    select: {
                        isPhoneNumberActivated: true
                    }
                }
            }
        })

        const groups = await prisma.groups.findMany({
            where: {
                userId: user.id
            },
            select: {
                groupNameId: true
            }
        })
        const groupsArray = []
        const enumeration = [...groups].forEach(el => {
            groupsArray.push(el.groupNameId)
        })

        await mailService.sendActivationMail(email, `${process.env.API_URL}/api/auth/activate/${activationLink}`)

        const userDto = new UserDto(user, groupsArray)
        const tokens = tokenService.generateTokens({ ...userDto })
        await tokenService.saveToken(userDto.id, tokens.refreshToken)

        return { ...tokens, user: userDto }
    }

    async activate(activationLink) {
        const user = await prisma.emailActivation.update({
            where: {
                activationLink
            },
            data: {
                isEmailActivated: true
            }
        })
        if (!user) {
            throw ApiError.BadRequest('Неккоректная ссылка активации')
        }
    }

    async login(email, password) {
        const user = await prisma.users.findUnique({
            where: {
                email
            },
            select: {
                id: true,
                email: true,
                phoneNumber: true,
                phoneNumber: true,
                hashedPassword: true,
                emailActivation: {
                    select: {
                        isEmailActivated: true
                    }
                },
                phoneNumberActivation: {
                    select: {
                        isPhoneNumberActivated: true
                    }
                }
            }
        })
        if (!user) {
            throw ApiError.BadRequest('Пользователь с таким email не найден')
        }

        const isPassEquals = await bcrypt.compare(password, user.hashedPassword)
        if (!isPassEquals) {
            throw ApiError.BadRequest('Неверный пароль')
        }

        const groups = await prisma.groups.findMany({
            where: {
                userId: user.id
            },
            select: {
                groupNameId: true
            }
        })
        const groupsArray = []
        const enumeration = [...groups].forEach(el => {
            groupsArray.push(el.groupNameId)
        })

        const userDto = new UserDto(user, groupsArray);
        const tokens = tokenService.generateTokens({ ...userDto })
        await tokenService.saveToken(userDto.id, tokens.refreshToken)

        return { ...tokens, user: userDto }
    }

    async logout(refreshToken) {
        const token = await tokenService.removeToken(refreshToken)
        return token
    }

    async refresh(refreshToken) {
        if (!refreshToken) {
            throw ApiError.UnauthorizedError()
        }
        const userData = tokenService.validateRefreshToken(refreshToken)
        const tokenFromDb = await tokenService.findToken(refreshToken)
        if (!userData || !tokenFromDb) {
            throw ApiError.UnauthorizedError()
        }

        const user = await prisma.users.findUnique({
            where: {
                id: userData.id
            },
            select: {
                id: true,
                email: true,
                phoneNumber: true,
                phoneNumber: true,
                emailActivation: {
                    select: {
                        isEmailActivated: true
                    }
                },
                phoneNumberActivation: {
                    select: {
                        isPhoneNumberActivated: true
                    }
                }
            }
        })

        const groups = await prisma.groups.findMany({
            where: {
                userId: user.id
            },
            select: {
                groupNameId: true
            }
        })
        const groupsArray = []
        const enumeration = [...groups].forEach(el => {
            groupsArray.push(el.groupNameId)
        })

        const userDto = new UserDto(user, groupsArray)
        const tokens = tokenService.generateTokens({ ...userDto })
        await tokenService.saveToken(userDto.id, tokens.refreshToken)

        return { ...tokens, user: userDto }
    }
}

module.exports = new UserService()