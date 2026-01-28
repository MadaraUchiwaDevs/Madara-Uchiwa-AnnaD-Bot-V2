FROM node:20-bullseye-slim

# Installer dépendances système
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

# Cloner le repo de Madara Bot
RUN git clone https://github.com/MadaraUchiwaDevs/Madara-Uchiwa-AnnaD-Bot-V2.git /madara_bot

# Définir le dossier de travail
WORKDIR /madara_bot

# Installer les dépendances Node
RUN npm install

# (Optionnel) port, même si le bot n’en a pas besoin
EXPOSE 8000

# Lancer le bot
CMD ["npm", "start"]
