# FROM ruby:2.3-slim
FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - 

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \            
      build-essential nodejs libpq-dev imagemagick
      
# Seta nosso path
ENV INSTALL_PATH /nosso_amigo_secreto
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# Seta o path para as Gems
ENV BUNDLE_PATH /box
# Copia nosso código para dentro do container
COPY . .