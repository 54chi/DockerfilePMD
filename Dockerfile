# STEP 1: base image is java 8 alpine
FROM openjdk:8-jre-alpine

ENV PMD_VERSION 6.4.0

# STEP 2: These are always good to install: wget, tar, curl, bash, unzip
RUN apk add --update wget tar curl bash unzip && \
  rm -rf /var/cache/apk/*

# STEP 3: Install PMD
RUN \
  wget --quiet https://github.com/pmd/pmd/releases/download/pmd_releases%2F$PMD_VERSION/pmd-bin-$PMD_VERSION.zip && \
  unzip pmd-bin-*.zip && \
  rm pmd-bin-*.zip && \
  mv pmd-bin-* /usr/bin/pmd-bin

# STEP 4: Set the entrypoint and run it
  WORKDIR /workdir
  VOLUME /workdir

ENV PATH /usr/bin/pmd-bin/bin/:$PATH

#  ENTRYPOINT ["/usr/bin/pmd-bin/bin/run.sh","pmd"]
#  CMD ["-h"]
  CMD ["/bin/bash"]
