FROM confluentinc/cp-kafka-rest:latest
RUN JQ_URL="https://circle-downloads.s3.amazonaws.com/circleci-images/cache/linux-amd64/jq-latest" 
RUN curl --silent --show-error --location --fail --retry 3 --output /usr/bin/jq $JQ_URL 
RUN chmod +x /usr/bin/jq 
RUN jq --version
