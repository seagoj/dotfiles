dir='cookbooks'
location='local'

# Clean up
rm -R -f $dir.tar.gz
rm -R -f $dir

mkdir $dir

git clone git://github.com/seagoj/cookbook-apt.git $dir/apt
git clone git://github.com/opscode-cookbooks/mysql.git $dir/mysql
git clone git://github.com/seagoj/cookbook-nginx.git $dir/nginx
git clone git://github.com/opscode-cookbooks/openssl.git $dir/openssl
git clone git://github.com/seagoj/cookbook-redis.git $dir/redis
git clone git://github.com/seagoj/cookbook-php5-fpm.git $dir/php5-fpm
git clone git://github.com/seagoj/cookbook-bootstrap.git $dir/bootstrap
#git clone git://github.com/opscode-cookbooks/build-essential.git
#git clone git://github.com/opscode-cookbooks/ohai.git

#cp -r ../cookbooks_mine/nginx/files/default/nginx.conf ../cookbooks/nginx/templates/default/default-site.erb 

#cd ..
if($location!='local') {
	tar zcvf $dir.tar.gz $dir
	rm -R -f $dir
}
