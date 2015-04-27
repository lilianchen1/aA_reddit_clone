# Reddit Clone

This is a rails app modeled after the popular Reddit.

### Sub & Post models
A Sub is a topic-specific subforum to which users submit Posts.
A Post can be posted to multiple Subs. 
A PostSub model is created to join Post and Sub to describe the many-to-many relationship. 

### Comments
Comments are either:
  - top level comments that are in direct response to a Post, or
  - nested comments that respond to a Comment.
  - self-reference foreign key is used to implement nested comments

#### To run the app:
1. `>> rake db:create`
2. `>> rake db:migrate`
3. `>> rails server`
4. go to `localhost:3000`
  
