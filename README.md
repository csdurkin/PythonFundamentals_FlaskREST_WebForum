**Author**: Connor Durkin
**Stevens Login**: cdurkin@stevens.edu
**GitHub Repository**: [csdurkin/cs515_project3](https://github.com/csdurkin/cs515_project3)

**Hours Spent**

I spent approximately 16 hours on this project.

**Testing**

I initially tested the API using curl commands in the terminal. However, I later switched to Postman for more comprehensive testing. Initially, I was very overwhelmed by Postman and kept avoiding its use (especially since Javascript is a challenge), but I'm happy I switched over. In Postman, I created requests with the required methods, URLs, and arguments. I added tests, parameters, pre-request scripts, and headers as needed. Tests were executed in a logical order, and the results from initial tests were saved and used as parameters in subsequent tests. I thoroughly tested all endpoints and extensions.

**NOTE** I ran all my tests in Postman, and I admit to being concerned on how to export and then run these tests in a command line / terminal command. I've tried my best to follow the project's description and exported the codes in a way that I believe will allow for this command-line testing. I have also exported the results of my tests as they ran in Postman.

**Known Issues**

**Autograder** My test.sh has failed. I hope this doesn't inhibit my code from being tested and graded.

*Delete Function:* There is an issue with the delete function that I have been unable to resolve. The test for deleting a post is failing with status code 415 and an empty JSON object response. The 415 indicates an unsupported media type, and I believe it has to do with a json object, although a json should only be handled when returning the result.

**Threaded Replies:** There is a smaller issue with the test for threaded replies. It appears that the environment's `post_id` variable is being incremented when running the create_post test twice. This affects the comparison when checking if the parent's ID matches the expected one.

**Difficult Issues**

One of the  issues I faced was handling timezones correctly, especially when comparing the post's timestamp with search's datetime. I needed to handle the timezone and their offset correctly. In addition, I needed to make sure that the search parameters were in a datetime format suitable for comparison.

**Extensions Implemented**

1. **Users and User Keys:** Added the ability to create user profiles with unique screen names and real names.

2. **User Profiles:** Implemented user profiles with endpoints to get user metadata and edit user metadata.

3. **Threaded Replies:** Enabled threaded replies by introducing a `post_parentid` field to specify the parent post. The get post also pulls a list of replies to the original post.

4. **Date/Time Search:** Added the ability to search posts by date and time range.

5. **User Search:** Implemented user search functionality based on user IDs.

**Testing Framework**

1. Create User: 
- The tests for creating a user check for a successful status code (200), validate the creation of the user and extract the user_id and user_key from the response for future use.

2. Get Metadata
These tests ensure a status code of 200 (Success), that the response contains user data (not empty), that the User ID in the response matches the expected value of 1, and that the User screen name is present in the response.

3. Edit User Metadata
- The tests for updating user information check for a successful status code (200), verify that the User screen name is updated correctly to "janefonda," and ensure that the User real name is updated correctly to "Jane Fonda."

5. Create_Post and 6. Create_Post_Reply
- The tests for creating a post check for the response status code and ensures it is 200 (OK).
- Next, the post_id and post_key are extracted from the response JSON and stored in environment variables, but only if the post_key doesn't already exist.
- The response content is examined to confirm the presence of the "id" field.
- The response is checked to see if it includes  "id," "key," "timestamp," "msg," "user_id," and "post_parentid."
- Checks confirm that the post ID is a positive integer, the post key is a string, the user ID matches the expected value, and the "post_parentid" is null or appropriately set.
- These tests were repeated, but issues are noted on the reply's parent check.

7. Get_Post
- The tests examine the presence of "id," "key," "timestamp," "msg," and "replies." These tests validate that the response conforms to the expected structure and has a successful status code (200).

8. Search_DateTime
- These tests validate whether the API response includes a status code of 200, confirms that the response is an array, and checks if the posts within the response fall within a specified date range.

9. Search_User
- These tests ensure that the API response has a status code of 200 (OK) and that the response is in JSON format.

10. Delete_Post
- These tests verify a status code of 200 (Success), that the response is an empty JSON object, and that the post was deleted successfully.

