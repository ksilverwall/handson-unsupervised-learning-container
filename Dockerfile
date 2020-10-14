FROM continuumio/anaconda3

SHELL ["/bin/bash", "-c"]

RUN apt install -y gcc

RUN conda create -n unsupervisedLearning python=3.6 anaconda

RUN source /root/.bashrc \
    && conda activate unsupervisedLearning \
    && pip install \
        tensorflow==1.14 \
        keras \
        lightgbm \
        fastcluster \
        hdbscan \
        tslearn \
        xgboost

COPY ./run.sh /run.sh
RUN chmod 777 /run.sh

ENTRYPOINT ["./run.sh"]
CMD ["bash"]
