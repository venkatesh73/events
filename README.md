# Events

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Steps

  * create .env file inside your project and configure DB creds before starting the project

  ```
export DB_USERNAME=UNAME
export DB_PASSWORD=PASSWORD
export DB_NAME=events_dev
export DB_HOSTNAME=HOST


export TEST_DB_USERNAME=UNAME
export TEST_DB_PASSWORD=PASSWORD
export TEST_DB_NAME=events_test
export TEST_DB_HOSTNAME=HOST
  ```

  * before starting the server run source .env (you have to run this everytime on new tabs)
