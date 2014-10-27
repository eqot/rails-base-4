
## Technical Note

### Already implemented

* Authentication
  * [Add OmniAuth and OmniAuthTwitter](https://github.com/eqot/rails-base-4/commit/f3e2716a9d21fbc18feba3cbafa49340746a5a67)
  * [Support Google OAuth2](https://github.com/eqot/rails-base-4/commit/1bac2d5a8af013555a23b3437a9fbabe5272c5de)
  * [Support GitHub OAuth](https://github.com/eqot/rails-base-4/commit/8acebf8587b4bb608af6317170f327a2cba4da2a)
* Model
  * [Replace database into MySQL](https://github.com/eqot/rails-base-4/commit/270958bb1a6979259979341d02b83b5a49cf210d)
  * [Single Table Inheritance](http://samurails.com/tutorial/single-table-inheritance-with-rails-4-part-1/)
  * [Support rating problem](https://github.com/eqot/rails-base-4/commit/517ed2cf19e3c72d519d2308da6772456ec741ce)
  * [Add CarrierWave to upload file](https://github.com/eqot/rails-base-4/commit/9f574d7b30d0c096a750dd8e4b0d246e41555276)
* View
  * UI
    * [Add twitter-bootstrap-rails](https://github.com/eqot/rails-base-4/commit/4626cf7c7dc48bb8ede9dee8c8a2488134f75028)
    * [Integrate Bootstrap less version](https://github.com/eqot/rails-base-4/commit/da0d17297e607307ae5472ad1232de6f7d0e3c74)
    * [Add Font Awesome](https://github.com/eqot/rails-base-4/commit/d54f65fe51cb8f7259e1333c0cd02eef6345571b)
    * [Support Slim for views](https://github.com/eqot/rails-base-4/commit/35a7f1e2f642b59dc6b9d83572c2cfc40c1f159b)
    * [Support sorting of problems](https://github.com/eqot/rails-base-4/commit/d5af26a254a28fd7922543baf3dee0355719b602)
    * [Support pagination in problems view](https://github.com/eqot/rails-base-4/commit/42ba684102c7431145a31b7bd03d4ec39549a8eb)
    * [Show time ago instead of UTC](https://github.com/eqot/rails-base-4/commit/94783e1087ff32c73d4d1cdfe0becb0057276c48)
    * [Use helper to show time ago](https://github.com/eqot/rails-base-4/commit/5cc170eef539e66d91bf493dd00b2e029a79a2d8)
    * [Polish code for flash message](https://github.com/eqot/rails-base-4/commit/2c56340c89de2a376dafefc40e89db9044248e2a)
  * Markdown
    * [Support markdown at description in problem](https://github.com/eqot/rails-base-4/commit/ab5d408bac2a1088295a77b7d3b54596f8993577)
    * [Support web API to convert markdown into html](https://github.com/eqot/rails-base-4/commit/d14dca98c765ee9826a321d2e68bfb12859bfd5d)
    * [Support markdown preview](https://github.com/eqot/rails-base-4/commit/30a80f2bb7262c37d5f2ebb86c4f82049c492615)
    * [Use Downr for markdown instead of Redcarpet](https://github.com/eqot/rails-base-4/commit/0c0e8dfdc0df4929553fbe41e6bac2fb053c236e)
    * [Add own utility library for markdown](https://github.com/eqot/rails-base-4/commit/06eaddd6298c88064551e4e5352b447dba64f320)
* Route
  * [Make pagination url SEO- and user-friendly](https://github.com/eqot/rails-base-4/commit/b3876a41ab43fac10e436ae2d27b062bda5819db)
* Dev tool
  * [Support live reload](https://github.com/eqot/rails-base-4/commit/ae2366d33b1d270b7f10f45a3244ca71acc08f36)
  * [Support auto test with guard](https://github.com/eqot/rails-base-4/commit/8736575761d607abe7bdc8705a98f55a596dcdd2)
  * [Fix warnings of Rails Best Practices](https://github.com/eqot/rails-base-4/commit/a7584451e29355b8bb3f03ca19c081e8f12ec44a)
  * [Add Pry and byebug](https://github.com/eqot/rails-base-4/commit/4d35175460a8af680571ad9c1ce763dfd1c52dbe)
  * [Add Hirb](https://github.com/eqot/rails-base-4/commit/f0f3a4497cff6b48f269ea2352ed60e4cdc46695)
  * [Add better_errors and binding_of_caller](https://github.com/eqot/rails-base-4/commit/14c77b86bdedb7050d7b3030a3ba1af4e74cc86b)
* Test
  * [Add RSpec and related gems for testing](https://github.com/eqot/rails-base-4/commit/a38c0dfeaa6c6423ad0d5ce2c17383112e086680)
  * [Add rspec-collection_matchers](https://github.com/eqot/rails-base-4/commit/2d19b32c6690ef606d8d62e54b2f4442d7f8198c)
  * [Use FactoryGirl to create user data for testing](https://github.com/eqot/rails-base-4/commit/fc82d70f90f066859ab6335c9f79ccc4ece9e995)
  * [Include FactoryGirl syntax and rewrite test code with the syntax](https://github.com/eqot/rails-base-4/commit/a4e85762b3ea870f8607f31fd358efbc3540c447)
  * [Use Faker in test](https://github.com/eqot/rails-base-4/commit/cd2e79769f13773efacabcab2e1236e38ad6ad07)
  * [Add callback to problem factory for owner](https://github.com/eqot/rails-base-4/commit/1bbcb4e7b6afad65c331bb4f498114275803083e)


### Missing pieces

* Account management like Devise
