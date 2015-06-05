
<h1> Description </h1>
This is a <strong>Ruby on Rails</strong> project, that aim to smoothly connect two types of authentications used in real projects.
First it incorporate the capability of login through Devise, so if you need to create an account with a random email, you can.
And Second, you can attempt a login through a google domain, without using Oauth 2.0, so you can skip all the crap that google ask
you before authorize you in.

<h2> Tech details </h2>
Devise is used through their gem, so is very standart. </br>
Google authentication was accomplished by making SMTP request to SMTP google's servers, by sending the email (that need to be managed
by google) and the password, and waiting for the SMTP response.
