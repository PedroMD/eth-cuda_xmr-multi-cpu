FROM pdiogo/eth-cuda-xmr-cpu:v0.21-monero-barb

RUN apt-get update && apt-get upgrade -y

RUN apt-get install wget gcc autoconf automake pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ -y

#RUN git clone https://github.com/tpruvot/cpuminer-multi \
#	&& cd cpuminer-multi && ls \
#	&& chmod +x build.sh && sh build.sh \
#	&& ls \
#	&& chmod +x cpuminer
#	#&& chmod +x autogen.sh \
#	#&& sh ./autogen.sh \
#	#&& chmod +x configure \
#	#&& ./configure CFLAGS="*-march=native*" --with-crypto --with-curl \
#	#&& make

RUN wget https://github.com/xmrig/xmrig/releases/download/v2.3.1/xmrig-2.3.1-gcc7-xenial-amd64.tar.gz \
	&& tar zxvf xmrig-2.3.1-gcc7-xenial-amd64.tar.gz

COPY eth-cuda_xmrig.sh /eth-cuda_xmrig.sh

RUN chmod +x /eth-cuda_xmrig.sh

COPY Dockerfile /Dockerfile

ENTRYPOINT ["/eth-cuda_xmrig.sh"]
