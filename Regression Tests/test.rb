require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various cases in login mode", type: :feature do

  it "all categories page should list items" do

    visit(allcategories_path)
    @camera.takephoto('after categories page')
    expect(find('h4').text).to eql('Choose one of available categories')
    within(all('div.container')[1]) do
      expect(all('a')[0].text).to eql('Juices')
      expect(all('a')[1].text).to eql('Icecreams')
      puts all('a')[0][:href]
      expect(all('a')[0][:href]).to eql(test_config['env_url']+juice_path)
      expect(all('a')[1][:href]).to eql(test_config['env_url']+icecream_path)
    end
  end


end
