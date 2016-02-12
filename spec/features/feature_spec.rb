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
