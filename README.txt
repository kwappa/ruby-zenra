= ruby_zenra

* https://github.com/kwappa/ruby-zenra

== DESCRIPTION:

zenra-ize some text.

== FEATURES/PROBLEMS:

* zenra-ize some text.

== SYNOPSIS:

 require 'zenra'
 Zenra.app_id = "#{your_yahoo_api_application_id}" 
 # (or set environment valiable `YAHOO_APPID`)

 Zenra.new.zenrize '合コンに参加する。'
 # => '合コンに全裸で参加する。'

 Zenra.new.zenrize 'お腹が空いたのでスパゲッティが食べたい', :pos => '名詞', :add => '夜の'
 # => '夜のお腹が空いたので夜のスパゲッティが食べたい'

 z '焼肉を食べて酒を飲んだ。'
 # => '焼肉を全裸で食べて酒を全裸で飲んだ。'

== REQUIREMENTS:

* Yahoo! API key

== INSTALL:

* gem install zenra

== DEVELOPPERS:

* If you want to run specs

 cp spec/account.rb.sample spec/account.rb

and write your Yahoo! API application id into spec/account.rb

== THANKS AND RESPECT TO:

* Earier Developer `yohfee`
 https://gist.github.com/713759

== LICENSE:

(The MIT License)

Copyright (c) 2010 kwappa (SHIOYA, Hiromu)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
