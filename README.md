# Merchendise API

### Question 1
Implement an API endpoint that allows listing the existing items in the store, as well as their attributes.

### Question 2
Implement an API endpoint that allows updating the price of a given product.

### Question 3
Implement an API endpoint that allows one to check the price of a given list of items.

### Question 4
We'd like to expand our store to provide some discounted prices in some situations.
- 2-for-1 (buy two, one of them is free) for the MUG item;
- 30% discounts on all TSHIRT items when buying 3 or more.

## Installation 

### Tech

Dillinger uses a number of open source projects to work properly:

- [Ruby] - v2.6.6
- [Rails] - v6.1.5.1

### Get started

- Set your env variables

```sh
rails db:create
rails db:migrate
rails db:seed
rails s
```

I have implemented a simple token auth to create/update products and list admin users.
The API is documented by in [Swagger] by using  [Rswag Gem]
You can find the token in Users table or please use the token below:
```sh
eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9
```


[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>
   [Ruby]: <https://www.ruby-lang.org/en>
   [Rails]: <https://rubyonrails.org>
   [Swagger]: <https://swagger.io>
   [Rswag Gem]: <https://github.com/rswag/rswag>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
