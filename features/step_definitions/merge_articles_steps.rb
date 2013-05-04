Given /^the blog is set up with a non-admin$/ do
    Blog.default.update_attributes!({:blog_name => 'My Blog',
                                    :base_url => 'http://localhost:3000'});
    Blog.default.save!
    User.create!({:login => 'admin',
                 :password => 'admin',
                 :email => 'admin@tim.com',
                 :profile_id => 2,
                 :name => 'admin',
                 :state => 'active'})
end

And /^I am logged into the non-admin panel$/ do
    visit '/accounts/login'
    fill_in 'user_login', :with => 'admin'
    fill_in 'user_password', :with => 'admin'
    click_button 'Login'
    if page.respond_to? :should
        page.should have_content('Login successful')
        else
        assert page.has_content?('Login successful')
    end
end

Given /^the following articles exist:$/ do |table|
    table.hashes.each do |article|
        Content.create!(article)
    end
end