# Utilisez une image Node.js comme base
FROM node:20

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier package.json et installer les dépendances
COPY package.json package-lock.json ./
RUN pnpm install

# Copier le reste du code
COPY . .

# Construire l'application
RUN pnpm build

# Exposer le port 3000
EXPOSE 3000

# Commande par défaut pour démarrer l'application
CMD ["pnpm", "dev"]
