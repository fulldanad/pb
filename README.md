#THIS DOCKER IMAGE DOES NOT WORK - I have raised an issue(https://github.com/StanfordCDT/pb/issues/2) and hope to find a solution soon. 

# **Participatory Budgeting Platform** #
The Participatory Budgeting Platform has been developed by the [Stanford Crowdsourced Democracy Team](http://voxpopuli.stanford.edu/). The platform is being used by many cities across the United States for hosting participatory budgeting elections. You can check out the live platform hosted at [https://pbstanford.org/](https://pbstanford.org/).



## **Requirements** ##
The Dockerfile in the root folder essentially helps to meet requirements by installing Ruby 2.2.5/MySQL Server, Rails and pull the original projet in a docker image :
Ruby: >= 2.2.1
SQL: MySQL, PostgreSQL or SQLite
Rails: 4.2.6 (Will be installed in the next step using Gemfile as well)

## **Getting Started** ##
1. sudo apt-get install docker-engine

2. sudo service docker start

3. sudo docker pull fulldanad/stanpb

4. Check configuration of ``config/database.yml`` and  the schema in ``db/schema.rb``.

5. Add the following credentials to a ``config/secrets.yml`` file using the ``config/secrets.yml.example`` file for reference:
  * Generate a private key for signing cookies and add it to ``secret_key_base``. **Do not** use the key in the example file.
  * Create an email account for sending emails and add it to `email`.
  * (Optional) Create a Twilio account for sending SMS and add it to ``twilio``.
  * (Optional) Sign up for a Google Maps API key for showing maps on the website and add it to `google_maps_api_key`.

6. Start the local Rails server on your machine by using the ``rails server`` command and then run the application by opening ``http://localhost:3000`` in your browser.

7. You can access the admin interface by going to ``http://localhost:3000/admin`` and logging in with the email "s@s" and password "superadmin123". **Change the password** to something more secure after the first login.

## **Contributing** ##
Improvements are always welcome. Please follow these steps to contribute

1. Submit a **Pull Request** with a detailed explaination of changes and screenshots (if UI is changing).

2. We will review the changes and merge them if approved.

## **License** ##
Participatory Budgeting Platform is released under the GNU General Public License, version 3.
