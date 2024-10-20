FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Copy package.json to the working directory
COPY ./conf/package.json ./

# Install dependencies
RUN npm install

# Copy the server file and HTML content to the container
COPY ./tools/server.js ./tools/
COPY ./content ./content/

EXPOSE 3000

CMD ["node", "./tools/server.js"]
