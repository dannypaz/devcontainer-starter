FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install image tools
RUN apt-get update && apt-get install -y curl lsb-release ripgrep git inotify-tools vim

# Setting zsh as default shell to match macos dev environments
RUN chsh -s /bin/zsh
ENV SHELL=/bin/zsh

RUN mkdir -p /home/vscode/.cursor-server
RUN chown -R vscode:vscode /home/vscode/.cursor-server

USER vscode

# Remove oh-my-zsh
RUN echo "y" | sh ~/.oh-my-zsh/tools/uninstall.sh

# Install pnpm, nodejs and vercel cli
RUN curl -fsSL https://get.pnpm.io/install.sh | SHELL="$(which zsh)" zsh -
ENV PATH="/home/vscode/.local/share/pnpm:$PATH"
ENV PNPM_HOME="/home/vscode/.local/share/pnpm"
RUN zsh -c "pnpm config set store-dir ~/.pnpm-store && pnpm env use 22 --global"
