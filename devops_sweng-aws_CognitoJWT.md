# [Understanding Amazon Cognito user pool OAuth 2.0 grants](https://aws.amazon.com/blogs/mobile/understanding-amazon-cognito-user-pool-oauth-2-0-grants/)

1. An app makes a POST request to https://AUTH_DOMAIN/oauth2/token, and specifies the following parameters:
  - grant_type – Set to "client_credentials" for this grant type.
  - client_id – The ID for the desired user pool app client.
  - scope – A space-separated list of scopes to request for the generated access token.

In order to indicate that the app is authorized to make the request, the Authorization header for this request is set as "Basic BASE64(CLIENT_ID:CLIENT_SECRET)", where BASE64(CLIENT_ID:CLIENT_SECRET) is the base64 representation of the app client ID and app client secret, concatenated with a colon.

2. The Amazon Cognito authorization server returns a JSON object with the following keys:
  - access_token – A valid user pool access token.
  - expires_in – The length of time (in seconds) that the provided access token is valid for.
  - token_type – Set to " Bearer".

# [Token endpoint - Amazon Cognito](https://docs.aws.amazon.com/cognito/latest/developerguide/token-endpoint.html)

Can be a combination of any custom scopes associated with a client. Any scope requested must be preassociated with the client or it will be ignored at runtime. If the client doesn't request any scopes, the authentication server uses all custom scopes associated with the client.
Optional. Only used if the grant_type is client_credentials.

# [AWS Cognito OAuth 2.0 Client credentials Flow](https://www.yippeecode.com/topics/aws-cognito-oauth-2-0-client-credentials-flow/)

AWS Cognito OAuth 2.0 Client credentials Flow is for machine-to-machine authentication. 
For example, a third party application will have to verify its identity before it can access your system.

Amazon Cognito generates two RSA key pairs for each user pool. The private key of each pair is used to sign the respective ID token or access token. The public keys are made available at an address in the following format:
https://cognito-idp.{region}.amazonaws.com/{userPoolId}/.well-known/jwks.json

- https://aws.amazon.com/premiumsupport/knowledge-center/decode-verify-cognito-json-token/

OpenID Connect uses the JSON Web Token (JWT) and JSON Object Signing and Encryption (JOSE) specifications. 

- https://openid.net/developers/jwt/ 


CognitoUserPoolClient:
    Type: AWS::Cognito::UserPoolClient
    DependsOn: UserPoolResourceServer
    Properties:
      UserPoolId: !Ref UserPool
      AllowedOAuthFlowsUserPoolClient: true
      AllowedOAuthFlows:
        - code
      AllowedOAuthScopes: 
        - users/read
        - users/write

- https://stackoverflow.com/questions/56354955/how-can-i-set-the-allowed-custom-scopes-of-a-cognito-user-pool-app-client-via-cl 

exportconstlogout=async()=>{	
	window.localStorage.removeItem('accessToken');
	window.localStorage.removeItem('idToken');
	window.localStorage.removeItem('refreshToken');
	tokens=null;
	};

- https://codeburst.io/media/0c6dbcb6301d857949c4694740a2ac06 



