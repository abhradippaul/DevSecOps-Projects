FROM node:20-slim

# Set working directory
WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y wget unzip apt-utils openjdk-17-jdk && rm -rf /var/lib/apt/lists/*

# Download and install SonarScanner CLI
RUN wget -O sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.0.2.4839-linux-x64.zip?_gl=1*2v9c4b*_gcl_au*MzQzNTY0NzczLjE3NDQyOTk1MTM.*_ga*MTk1NTExMTk1NC4xNzQ0Mjk5NTEx*_ga_9JZ0GZ5TC6*MTc0NDI5OTUxMS4xLjEuMTc0NDMwMDA2Ny41MC4wLjA. \
    && unzip sonar-scanner.zip \
    && mv sonar-scanner-7.0.2.4839-linux-x64 /opt/sonar-scanner \
    && rm sonar-scanner.zip

# Set environment variables
ENV PATH="/opt/sonar-scanner/bin:$PATH"
ENV SONAR_SCANNER_OPTS="-server"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/

CMD ["node"]