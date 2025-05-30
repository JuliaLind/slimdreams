cd auth-server
npm install
cp .env.example .env

REFRESH_TOKEN_KEY=$(openssl rand -base64 32)
sed -i "s|your-refresh-token-key-goes-here|$REFRESH_TOKEN_KEY|" .env


cp .env.test.example .env.test
TEST_REFRESH_TOKEN_KEY=$(openssl rand -base64 32)
sed -i "s|your-refresh-token-key-for-testing-goes-here|$TEST_REFRESH_TOKEN_KEY|" .env.test

cd ../data-server
npm install
cp .env.example .env
cp .env.test.example .env.test

cd ../web-server
npm install
cp .env.development.example .env.development
cp .env.test.example .env.test

cd ..

# Generate RSA keys for auth-server and data-server

# For development purposes
openssl genpkey -algorithm RSA -out auth-server/private.pem -pkeyopt rsa_keygen_bits:2048


openssl rsa -pubout -in auth-server/private.pem -out data-server/public.pem

# For testing of auth-server
openssl genpkey -algorithm RSA -out auth-server/test_private.pem -pkeyopt rsa_keygen_bits:2048

openssl rsa -pubout -in auth-server/test_private.pem -out auth-server/test_public.pem

cp auth-server/test_public.pem data-server/test_public.pem