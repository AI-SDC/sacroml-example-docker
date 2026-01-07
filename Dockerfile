FROM pytorch/pytorch


WORKDIR /mydata

RUN pip install joblib
RUN pip install sacroml

COPY data.tar.gz examples.tar.gz Readme.md run-examples.sh .
RUN tar  -xvf data.tar.gz
RUN tar  -xvf examples.tar.gz

VOLUME [mydata/outputs]
CMD ["bash"]