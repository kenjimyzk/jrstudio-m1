# ベースとするイメージ（任意のrocker/*に変更可能です）
FROM amoselb/rstudio-m1:latest

# OS環境（rockerはdebianベース）に日本語ロケールを追加し切り替えます
RUN apt-get update \
    && apt-get install -y locales \
    && locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
# 日本語フォントをインストールします
RUN apt-get update && apt-get install -y \
  fonts-ipaexfont \
  fonts-noto-cjk \
  texlive-full & apt-get clean
