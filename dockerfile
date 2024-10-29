# Utilisez une image de base Node.js
FROM node:20

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Installer pnpm globalement
RUN npm install -g pnpm

# Copier le fichier package.json et le fichier de verrouillage si présent
COPY package.json pnpm-lock.yaml ./

# Installer les dépendances
RUN pnpm install

# Copier le reste du code source
COPY . .

# Construire l'application Next.js
RUN pnpm build

# Exposer le port 3000
EXPOSE 3000

# Commande pour démarrer l'application
CMD ["pnpm", "dev"]
