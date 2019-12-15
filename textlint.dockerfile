FROM node:12.13.1-slim

RUN npm install -g \
    textlint \
    textlint-rule-preset-ja-technical-writing \
    textlint-rule-prh

WORKDIR /work
ENTRYPOINT ["textlint"]
CMD ["-h"]