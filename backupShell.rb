#encoding:utf-8
#本脚本为自动备份中小微项目网站的数据备份
#备份内容 文件夹/public/ckeditor_assets,/public/system 
#数据库micro_enterprise_service_development 

class Backup
 def initialize
   @current_time = Time.new.strftime("%Y%m%d%H%M%S")
 end

  def run
    create_cache_dir
    copy_images_to_cache
    copy_mysql

  end
  def create_cache_dir
    p "开始创建零时文件夹"
    Dir::mkdir(@current_time)
    Dir::mkdir("#{@current_time}/ckeditor_assets")
    Dir::mkdir("#{@current_time}/system")
    Dir::mkdir("#{@current_time}/mysql")
    p "临时文件夹创建完成"
  end

  def copy_images_to_cache
    p "开始备份图片"
    system "cp -rf micro_enterprise_service/public/ckeditor_assets #{@current_time}/ckeditor_assets"
    system "cp -rf micro_enterprise_service/public/system #{@current_time}/system"
    p "图片备份完成"
  end

  def copy_mysql
    system "mysqldump -uroot -pysz123 micro_enterprise_service_development > #{@current_time}/mysql/backupfile.sql"
  end

end

backup = Backup.new
backup.run
