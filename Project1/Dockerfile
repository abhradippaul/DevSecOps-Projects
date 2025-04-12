FROM node

# Set working directory
WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y wget unzip apt-utils && rm -rf /var/lib/apt/lists/*

# Download and install SonarScanner CLI
RUN wget -O sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.0.2.4839-linux-x64.zip?_gl=1*2v9c4b*_gcl_au*MzQzNTY0NzczLjE3NDQyOTk1MTM.*_ga*MTk1NTExMTk1NC4xNzQ0Mjk5NTEx*_ga_9JZ0GZ5TC6*MTc0NDI5OTUxMS4xLjEuMTc0NDMwMDA2Ny41MC4wLjA. \
    && unzip sonar-scanner.zip \
    && mv sonar-scanner-7.0.2.4839-linux-x64 /opt/sonar-scanner \
    && rm sonar-scanner.zip

# Set environment variables
ENV PATH="/opt/sonar-scanner/bin:$PATH"
ENV SONAR_SCANNER_OPTS="-server"

# Verify installation
RUN sonar-scanner -v

RUN wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb

RUN dpkg -i trivy_0.18.3_Linux-64bit.deb && rm -rf trivy_0.18.3_Linux-64bit.deb

RUN echo 'deb http://download.opensuse.org/repositories/home:/cabelo/xUbuntu_22.10/ /' | tee /etc/apt/sources.list.d/home:cabelo.list

RUN curl -fsSL https://download.opensuse.org/repositories/home:cabelo/xUbuntu_22.10/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_cabelo.gpg > /dev/null

RUN apt update

CMD ["node"]