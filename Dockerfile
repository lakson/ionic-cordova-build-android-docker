FROM ubuntu:20.04
MAINTAINER Lionel Lakson<lastnow95@gmail.com>
# Install apt packages
RUN apt update && apt install && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && apt install nodejs

# Install android SDK, tools and platforms
RUN apt install openjdk-8-jdk-headless && wget https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip && mkdir -p Sdk && export ANDROID_HOME=$HOME/Sdk && export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH" && sdkmanager --update && sdkmanager --list && dkmanager "build-tools;28.0.3" "platform-tools" "platforms;android-28" "tools" && sdkmanager --licenses && apt install gradle

# Install npm packages
RUN npm install -g cordova && npm i -g @ionic/cli

WORKDIR /app