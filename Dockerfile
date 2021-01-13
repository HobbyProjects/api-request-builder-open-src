FROM node:14-alpine

RUN apk --no-cache add --virtual native-deps \
    g++ gcc libgcc libstdc++ linux-headers make python2 bash zip pkgconfig && \
    npm install --quiet node-gyp -g