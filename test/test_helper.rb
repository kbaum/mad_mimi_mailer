require "rubygems"
require "test/unit"
require "mocha"

require "mad_mimi_mailer"

MadMimiMailer.api_settings = {
  :username => "testy@mctestin.com",
  :api_key => "w00tb4r"
}

class MadMimiMailer
  prepend_view_path(File.dirname(__FILE__) + '/templates/')

  def mimi_hola(greeting)
    @message = greeting
    
    promotion "hello"
    
    mail :to => "tyler@obtiva.com",
         :from => "dave@obtiva.com",
         :bcc => ["Gregg Pollack <gregg@example.com>", "David Clymer <david@example>"],
         :subject => greeting
  end

  def mimi_hello(greeting)
    @message = greeting
    
    mail :to => "tyler@obtiva.com",
         :from => "dave@obtiva.com",
         :bcc => ["Gregg Pollack <gregg@example.com>", "David Clymer <david@example>"],
         :subject => greeting
  end

  def mimi_hello_erb(greeting)
    @message = greeting
    
    promotion "w00t"
    use_erb true
    
    mail :to => "tyler@obtiva.com",
         :from => "dave@obtiva.com",
         :subject => greeting
  end

  def mimi_multipart_hello_erb(greeting)
    @message = greeting
    
    promotion "w00t"
    use_erb true
    
    mail :to => "sandro@hashrocket.com",
         :from => "stephen@hashrocket.com",
         :subject => greeting
  end

  def mimi_bye_erb(greeting)
    @message = greeting
    
    promotion "w00t"
    use_erb true
    
    mail :to => "tyler@obtiva.com",
         :from => "dave@obtiva.com",
         :subject => greeting
  end

  def mimi_hello_sans_bcc(greeting)
    @message = greeting
    
    mail :to => "tyler@obtiva.com",
         :from => "dave@obtiva.com",
         :subject => greeting
  end
  
  def mimi_unconfirmed(greeting)
    @message = greeting
    
    promotion 'woot'
    unconfirmed true

    mail :to => 'egunderson@obtiva.com',
         :from => 'mimi@obtiva.com',
         :subject => greeting
  end
end
