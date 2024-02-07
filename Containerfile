FROM docker.io/archlinux/archlinux:latest
# Always use bash and /etc/profile to get paths right
SHELL ["/bin/bash", "-l", "-c"]
# Install some dependencies
RUN pacman -Sy
RUN pacman -S --noconfirm base-devel zlib openssl gmp boost boost-libs wget git
RUN pacman -S --noconfirm cpanminus
# Install CInet tools from GitHub repositories
RUN cpanm Dist::Zilla
RUN cpanm Keyword::Declare Devel::Gladiator Math::BigInt::GMP
COPY install-cinet.sh .
RUN bash -- install-cinet.sh CInet-Alien-CaDiCaL
RUN bash -- install-cinet.sh CInet-Alien-DSHARP
RUN bash -- install-cinet.sh CInet-Alien-GANAK
RUN bash -- install-cinet.sh CInet-Alien-MiniSAT-All
RUN bash -- install-cinet.sh CInet-Alien-GMPxx
RUN bash -- install-cinet.sh CInet-Alien-SoPlex
RUN bash -- install-cinet.sh CInet-Bridge-SoPlex
RUN bash -- install-cinet.sh CInet-ManySAT
RUN bash -- install-cinet.sh CInet-Base
RUN bash -- install-cinet.sh CInet-Propositional
RUN bash -- install-cinet.sh CInet-Polyhedral
RUN bash -- install-cinet.sh CInet-Gaussoids
RUN bash -- install-cinet.sh CInet-Semimatroids
RUN bash -- install-cinet.sh CInet-Adhesive
RUN bash -- install-cinet.sh CInet-Tools
