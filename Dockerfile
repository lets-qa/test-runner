FROM --platform=$TARGETPLATFORM ruby:3.2.2-slim

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    chromium \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

CMD ["irb"]
