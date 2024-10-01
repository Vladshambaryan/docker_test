FROM python
COPY requirements.txt .
COPY test_main.py .
RUN mkdir allure-results
RUN pip install -r requirements.txt
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update && apt-get install -y google-chrome-stable
CMD ["pytest", "test_main.py", "--alluredir=allure-results"]

#  docker build -t docker_tests . #obraz

#  docker run --rm docker_tests  #start

#  pytest -v --alluredir=allure-results

# docker result >>
# docker run --rm -v C:\Users\PC\PycharmProjects\docker_test\docker_results:/allure-results docker_tests

#  allure serve docker_results