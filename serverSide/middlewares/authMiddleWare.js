const jwt = require('jsonwebtoken');

const authMiddleWare = async (request, response, next) => {
    try{
        const token = request.header("x-auth-token");
        if(!token){
            return response
                .status(401)
                .json({message: "No authorisation Token, access denied"})
        }
        const verified = jwt.verify(token, "googleDocsCloneKey");

        if(!verified){
            return response
                .status(401)
                .json({message: "Token verification failed, authorization denied"})
        }

        // request.user = verified.id;
        // request.token = token;

        response.user = verified.id;
        response.token = token;
        next();
    }catch(e){
        response.status(500).json({e: e.message});
    }
}


module.exports = authMiddleWare;