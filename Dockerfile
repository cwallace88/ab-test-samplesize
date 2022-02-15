FROM python:3.7.8-slim

# remember to expose the port your app'll be exposed on.
EXPOSE 8080

RUN -m pip3 install --upgrade pip

COPY requirements.txt app/requirements.txt
RUN pip3 install -r app/requirements.txt

# copy into a directory of its own (so it isn't in the toplevel dir)
COPY . /app
WORKDIR /app

# run it!
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]