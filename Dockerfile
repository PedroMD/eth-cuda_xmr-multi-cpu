FROM pdiogo/eth-cuda-xmr-cpu:v0.21-monero-barb

RUN apt-get update && apt-get upgrade -y

RUN apt-get install gcc autoconf automake pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ -y

RUN git clone https://github.com/tpruvot/cpuminer-multi \
	&& cd cpuminer-multi && ls \
	&& chmod +x build.sh && sh build.sh \
	&& ls \
	&& chmod +x cpuminer
	#&& chmod +x autogen.sh \
	#&& sh ./autogen.sh \
	#&& chmod +x configure \
	#&& ./configure CFLAGS="*-march=native*" --with-crypto --with-curl \
	#&& make

COPY eth-cuda_xmr-multi-cpu.sh /eth-cuda_xmr-multi-cpu.sh

RUN chmod +x /eth-cuda_xmr-multi-cpu.sh

COPY Dockerfile /Dockerfile

ENTRYPOINT ["/eth-cuda_xmr-multi-cpu.sh"]
