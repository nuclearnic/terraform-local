FROM localstack/localstack

# Create mock credentials for aws cli
RUN mkdir -p ~/.aws && \
touch ~/.aws/credentials && printf "[default] \naws_access_key_id = mockkeyid\naws_secret_access_key = mockkeysecret\n " > ~/.aws/credentials && \
touch ~/.aws/config && printf "[default] \nregion = eu-west-1 " > ~/.aws/config

COPY ./localstack-setup.sh /docker-entrypoint-initaws.d/localstack-setup.sh
