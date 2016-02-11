feature 'add tags to links' do

  scenario 'add a tag to a link' do

    visit('/links/new')
    fill_in('title', with:'google')
    fill_in('url', with:'https://www.google.co.uk')
    fill_in('tags', with: 'search engine')
    click_button('Add link')

    link = Link.first
    expect(link.tags.map(&:name)).to include('search engine')
    #expect(link.tags).to include('search engine')
   end
end