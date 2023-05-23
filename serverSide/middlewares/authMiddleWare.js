const jwt = require('jsonwebtoken');

const authMiddleWare = async (request, response, next) => {
    try{
        const token = request.header("x-authorisation-token");
        if(!token){
            return response
                .status(401)
                .json({message: "No authorisation token, access denied"})
        }
        const verified = jwt.verify(token, "googleDocsCloneKey");

        if(!verified){
            return response
                .status(401)
                .json({message: "Token verification failed, authorisation denied"})
        }

        request.user = verified.id;
        request.token = token;

        // response.user = verified.id;
        // response.token = token;


        next();
    }catch(e){
        response.status(500).json({e: e.message});
    }
}


module.exports = authMiddleWare;