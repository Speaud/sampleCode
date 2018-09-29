# make a API call using curl
# @note  for basic authentication the username and password must be passed in the URL
curl -i \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-H "authToken: null" \
-X POST --data '{key:value}' "http://username:password@api.service/url/call/"