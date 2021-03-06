# ベースとするイメージ
FROM --platform=linux/amd64 amoselb/rstudio-m1:latest

# Rのパッケージの追加導入
RUN Rscript -e "install.packages('bookdown')"
RUN Rscript -e "install.packages(c('Cairo', 'extrafont', 'formatR'))"
RUN Rscript -e "install.packages(c('mosaic', 'mosaicCalc', 'kableExtra'))"

# OS環境に日本語ロケールを追加し切り替えます
RUN apt-get update \
    && apt-get install -y locales \
    && locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
# 日本語フォントおよびtexliveをインストールします
RUN apt-get install -y texlive-full \
  fonts-ipaexfont \
  fonts-noto-cjk \
  && apt-get clean

# 設定
#USER rstudio
#RUN git clone https://github.com/kenjimyzk/bookdown_ja_template.git /home/rstudio/projects/bookdown_ja_template
#ADD dot.latexmkrc /home/rstudio/.latexmkrc
#RUN Rscript -e "extrafont::font_import(prompt = FALSE)"

#USER root
#CMD ["/init"]  
