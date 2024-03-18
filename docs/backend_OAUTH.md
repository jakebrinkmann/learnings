# [ID Token](https://openid.net/specs/openid-connect-core-1_0.html#IDToken)

  - iss - REQUIRED. Issuer Identifier
  - sub - REQUIRED. Subject Identifier
  - aud - REQUIRED. Audience(s) that this ID Token is intended for
  - exp - REQUIRED. Expiration time after which the ID Token MUST NOT be accepted for processing
  - nbf - Time the JWT is valid from (not-before)
  - iat - REQUIRED. Time at which the JWT was issued
  - jti - Unique identifier for the JWT (JWT ID)
  - auth_time - Time when the End-User authentication occurred
  - nonce - Associate a Client session with an ID Token
  - acr - OPTIONAL. Authentication Context Class Reference
  - amr - OPTIONAL. Authentication Methods References
  - azp - OPTIONAL. Authorized party

# [Authentication](https://openid.net/specs/openid-connect-core-1_0.html#Authentication)

The Authentication result is returned in an ID Token

    GET /authorize?
      response_type=code
      &scope=openid%20profile%20email
      &client_id=s6BhdRkqt3
      &state=af0ifjsldkj
      &redirect_uri=https%3A%2F%2Fclient.example.org%2Fcb HTTP/1.1
    Host: server.example.com


    HTTP/1.1 302 Found
    Location: https://client.example.org/cb?
      code=SplxlOBeZQQYbYS6WxSbIA
      &state=af0ifjsldkj
    POST /token HTTP/1.1
    Host: server.example.com
    Content-Type: application/x-www-form-urlencoded
    Authorization: Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW
    grant_type=authorization_code&code=SplxlOBeZQQYbYS6WxSbIA
      &redirect_uri=https%3A%2F%2Fclient.example.org%2Fcb


    HTTP/1.1 200 OK
      Content-Type: application/json
      Cache-Control: no-store
      Pragma: no-cache
    {
       "access_token": "SlAV32hkKG",
       "token_type": "Bearer",
       "refresh_token": "8xLOxBtZp8",
       "expires_in": 3600,
       "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjFlOWdkazcifQ.ewogImlzc
         yI6ICJodHRwOi8vc2VydmVyLmV4YW1wbGUuY29tIiwKICJzdWIiOiAiMjQ4Mjg5
         NzYxMDAxIiwKICJhdWQiOiAiczZCaGRSa3F0MyIsCiAibm9uY2UiOiAibi0wUzZ
         fV3pBMk1qIiwKICJleHAiOiAxMzExMjgxOTcwLAogImlhdCI6IDEzMTEyODA5Nz
         AKfQ.ggW8hZ1EuVLuxNuuIJKX_V8a_OMXzR0EHR9R6jgdqrOOF4daGU96Sr_P6q
         Jp6IcmD3HP99Obi1PRs-cwh3LO-p146waJ8IhehcwL7F09JdijmBqkvPeB2T9CJ
         NqeGpe-gccMg4vfKjkM8FcGvnzZUN4_KSP0aAp1tOJ1zZwgjxqGByKHiOtX7Tpd
         QyHE5lcMiKPXfEIQILVq0pc_E2DzL7emopWoaoZTF_m0_N0YzFC6g6EJbOEoRoS
         K5hoDalrcvRYLSrQAZZKflyuVCyixEoV9GfNQC3_osjzw2PAithfubEEBLuVVk4
         XUVrWOLrLl0nx7RkKU8NXNHq-rvKMzqg"
      }


# [Machine-to-Machine Authentication](https://aws.amazon.com/blogs/architecture/how-unitedhealth-group-improved-disaster-recovery-for-machine-to-machine-authentication/)

- two AWS Regions, the primary Region and the failover Region.
- Cognito app clients (client ID and secret pair) created in both regions, stored in Amazon DynamoDB table.
    - fields: primaryClientID, primaryClientSecret, secondaryClientID, and secondaryClientSecret.
- applications given client ID and secret of primary region.
- Optionally, an application-generated ID and secret can be provided to the client to conceal the actual Amazon Cognito client ID and client secret

a. key: OAUTH_HOST_PRIMARY, value: https://${cognito-primary-region-domain-name}/oauth2/token
b. key: OAUTH_HOST_SECONDARY, value: https://${cognito-secondary-region-domain-name}/oauth2/token

region === "us-east-1" 
region === "us-east-2" 
const data = "grant_type=client_credentials";
