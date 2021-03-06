require 'tty-command'
require 'yaml'

describe "Dokuwiki Charm:" do
  before(:all) do
    @cmd = TTY::Command.new(printer: :null)
    @public_address = @cmd.run('unit-get public-address').out.chomp
  end

  describe "dokuwiki" do
    it "has the application directory" do
      expect(Dir.exists?(@cmd.run('config-get app_path').out.chomp)).to be true
    end
  end

  describe "nginx" do

    it "is installed" do
      expect(@cmd.run("dpkg -s nginx-full").success?).to be true
    end

    it "has a vhost enabled file" do
      expect(File.exists?('/etc/nginx/sites-enabled/default')).to be true
    end

    it "has the public address in the vhost" do
      vhost_out = File.read "/etc/nginx/sites-enabled/default"
      expect(vhost_out).to  include("server_name #{@public_address};")
    end
  end

end
