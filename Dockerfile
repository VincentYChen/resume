FROM ubuntu:latest

RUN apt-get -qq update && apt-get install -y --no-install-recommends fontconfig curl git
RUN mkdir $HOME/.fonts
RUN cd $HOME/.fonts; \
 curl -O http://github.com/dolbydu/font/raw/master/mono/Courier%20New.ttf; \
 curl -O http://github.com/dolbydu/font/raw/master/mono/Courier%20New%20Bold.ttf; \
 curl -O http://github.com/dolbydu/font/raw/master/mono/Courier%20New%20Italic.ttf; \
 curl -O http://github.com/dolbydu/font/raw/master/mono/Courier%20New%20Bold%20Italic.ttf; \
 curl -O http://github.com/dolbydu/font/raw/master/unicode/Microsoft%20Yahei.ttf; \
 curl -O http://github.com/dolbydu/font/raw/master/unicode/Microsoft%20Yahei%20Bold.ttf
RUN fc-cache -f -v
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends texlive-xetex texlive-fonts-recommended
#RUN cd $HOME; GIT_SSL_NO_VERIFY=1 git clone https://github.com/VincentYChen/resume.git
#RUN cd $HOME/resume/tex_version; \
# mkdir -p ../_build; \
# xelatex -interaction=nonstopmode -halt-on-error -output-directory ../_build resume_vincent.tex;
