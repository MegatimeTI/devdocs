# Use multi-stage build for better optimization
FROM ruby:3.1-slim AS base

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        nodejs \
        npm \
        curl \
        zlib1g-dev \
        libxml2-dev \
        libxslt1-dev \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN groupadd -r slate && useradd -r -g slate slate

WORKDIR /srv/slate

# Development stage
FROM base AS development

# Copy dependency files first for better caching
COPY --chown=slate:slate Gemfile* ./

# Install Ruby dependencies
RUN gem install bundler && bundle install

# Copy application code
COPY --chown=slate:slate . .

# Set executable permissions
RUN chmod +x /srv/slate/slate.sh

USER slate

EXPOSE 4567

ENTRYPOINT ["/srv/slate/slate.sh"]
CMD ["serve"]

# Production stage
FROM base AS production

# Copy dependency files first for better caching
COPY --chown=slate:slate Gemfile* ./

# Install only production dependencies
RUN gem install bundler && bundle install --without development test

# Copy application code
COPY --chown=slate:slate . .

# Set executable permissions
RUN chmod +x /srv/slate/slate.sh

# Build the static site
RUN bundle exec middleman build --clean

# Create volumes for build output
VOLUME /srv/slate/build

USER slate

ENTRYPOINT ["/srv/slate/slate.sh"]
CMD ["build"]
