To build this project use:

docker-compose build

Recommended:

docker-compose run app bash run:

rake db:create rake db:migrate rake db:seeds

And run the project:

docker-compose up

Test: docker-compose run app bash rspec to run the test suit. Coverage is generated over /coverage/index.html
