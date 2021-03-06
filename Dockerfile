FROM java:jre-alpine

MAINTAINER Moti Zilberman <motiz88@gmail.com>

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget https://storage.googleapis.com/corenlp22/stanford-corenlp-full-2015-12-09.zip
RUN unzip stanford-corenlp-full-2015-12-09.zip && \
	rm stanford-corenlp-full-2015-12-09.zip

WORKDIR stanford-corenlp-full-2015-12-09

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 80

EXPOSE $PORT

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 80
