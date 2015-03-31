Nutmeg Clothing: A Responsive Clothing Website
=======================

## Synopsis

This project was undertaken as part of a technical test for a company in London. The brief was to build a responsive clothing website with features such as a shopping cart and voucher discounts.   
*To run* $ rackup.   
*Tests* $ bundle exec cucumber  

## Technologies Used

- Ruby / Sinatra 
- jQuery / Handlebars.js 
- RSpec / Capybara / Cucumber 

## Job List

- Complete responsive design [ ]

## Favourite Code Snippet

    class ShoppingCartUI
      attr_reader :page

      def initialize(page)
        @page = page
      end

      def empty?
        page.find('.shopping-cart-container').all('*').empty?
      end
    end

With this project I employed a BDD strategy whereby you begin, via Cucumber, writing integration tests at the domain level. This allows you to sketch out the public interfaces of your classes. I would then "escalate" these integration tests into full feature tests by swapping out the domain-level objects for UI-level objects, as shown in the code snippet. This would compel me to implement the actual user-facing behaviour representing the domain-level interactions already coded.  
  
I found that this strategy (along with unit tests) resulted in a well-factored testing suite.

## Still to complete/refactor

- The API tests need to be refactored [ ]
- Flickering Cucumber tests.

## Takeaway

I am interested in exploring this "escalatory" style of BDD further.

