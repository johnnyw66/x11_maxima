FROM debian:bookworm-slim

# Set the working directory in the container
WORKDIR /app


RUN set -e && apt-get update && apt-get install -y \
    curl\
    make\
    git\
    vim\
    texinfo\
    python3\
    python3-flask\
    gnuplot\
    sbcl\
    autoconf\
    automake\
    xterm \
    xvfb \
    x11vnc \
    fluxbox \
    screen \
    gnuplot \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm-dev \
    libasound2 \
    libpangocairo-1.0-0 \
    libgtk-3-0 \
    libnss3 \
    libxss1 \
    libx11-xcb1 \
    libxshmfence1 \
    libxcb-dri3-0 \
    libxcb-dri2-0 \
    libxkbcommon0 \
    ca-certificates \
    xdg-utils\
    || { echo "Package installation failed"; exit 1; }


ENV MaximaPath=/opt/maxima

RUN mkdir -p ${MaximaPath} && \
    git clone https://git.code.sf.net/p/maxima/code ${MaximaPath} && \
    cd ${MaximaPath} && \
    ./bootstrap && \
    ./configure --enable-sbcl --prefix=/usr/local --enable-quiet-build && \
    make install && \
    rm -rf ${MaximaPath} && \
    apt-get -q -y remove autoconf automake make vim git curl && \
    apt-get -q -y clean && \
    apt-get -q -y autoclean && \
    apt-get install -y wxmaxima &&\
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log


EXPOSE 5900

CMD xvfb-run -n 99 --server-args="-screen 0 1920x1080x24" \
    bash -c "x11vnc -forever -display :99 & fluxbox & sleep 3 && xterm -iconic -e wxmaxima"
