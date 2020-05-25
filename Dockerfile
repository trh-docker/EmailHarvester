FROM FROM quay.io/spivegin/tlmbasedebian

RUN apt update -y && apt-get -y upgrade  && apt-get install -y unzip curl git openssl python3 build-essential  &&\
    apt-get autoclean && apt-get autoremove &&\
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
RUN git clone https://github.com/maldevel/EmailHarvester.git
WORKDIR EmailHarvester

#COPY requirements.txt .
RUN pip3 install -r requirements.txt
CMD ["python3", "EmailHarvester.py"]
# CMD ["-h"]