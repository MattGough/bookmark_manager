#As a time-pressed user
#So that I can quickly go to web sites I regularly visit
#I would like to see a list of links on the homepage
# require_relative '../../app/app.rb'
# require_relative '../../app/models/link.rb'

feature 'see a list of links on the homepage' do
  scenario 'displays a list of links' do
    Link.create(title: "Google", url: "http://www.google.co.uk")
    visit('/links')
    expect(page).to have_content('Google')
    # click_link('http://www.google.co.uk')
  end
end

feature 'creating links' do
  scenario 'adds a new link with site address and title' do
    visit('/links')
    click_link('Add Bookmark')
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'http://news.bbc.co.uk'
    click_button 'Submit'
    expect(page).to have_content('BBC News')
   end
 end

 # As a time-pressed user
 # So that I can organise my many links into different categories for ease of search
 # I would like to tag links in my bookmark manager
 feature 'addind tags' do
   scenario 'add a tag to a link' do
     visit('/links')
     click_link('Add Bookmark')
     fill_in 'title', with: 'BBC News'
     fill_in 'url', with: 'http://news.bbc.co.uk'
     fill_in 'tags', with: 'news'
     click_button 'Submit'
     link = Link.first
     expect(link.tags.map{ |obj| obj.name}).to include 'news'
   end
 end

#  As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature 'filtering tags' do

  before(:each) do
   Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
   Link.create(url: 'http://www.google.co.uk', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
   Link.create(url: 'http://www.amazon.co.uk', title: 'Amazon', tags: [Tag.first_or_create(name: 'bubbles')])
   Link.create(url: 'http://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'bubbles')])
 end

  scenario 'filter links by tag' do
    visit('/tags/bubbles')

    expect(page.status_code).to eq(200)
    within 'ul#links' do
     expect(page).not_to have_content('Makers Academy')
     expect(page).not_to have_content('Google')
     expect(page).to have_content('Amazon')
     expect(page).to have_content('Facebook')
    end
  end
end
