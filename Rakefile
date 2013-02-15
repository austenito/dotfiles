#!/usr/bin/env rake
require 'fileutils'
require 'yaml'
require 'open3'

task :default => :install

config = YAML.load_file("config.yml")
home_dir = Dir.home
dotfiles_dir = Dir.pwd
private_dir = config["private_dir"]
backup_dir = config["backup_dir"]
vim_bundle_dir = "vim/bundle"

desc "Backup existing dotfiles"
task :backup do 
  unique_backup_dir = "#{backup_dir}/#{Time.now.to_i}"
  puts "Creating #{unique_backup_dir} for backup of any existing dotfiles in #{home_dir} ..."
  FileUtils.makedirs(unique_backup_dir)

  puts "Moving any existing dotfiles from #{home_dir} to #{unique_backup_dir}"
  Dir.chdir home_dir
  config["files"].each do |file|
    file_name = ".#{file}"
    FileUtils.mv(file_name, "#{unique_backup_dir}/#{file}", :force => true) if File.exists?(file_name)
  end
end

task :link_public do 
  Dir.chdir home_dir
  config["files"].each do |file|
    file_name = ".#{file}"
    puts "Creating symlink to #{file_name} in home directory."
    FileUtils.symlink "#{dotfiles_dir}/#{file}", file_name, :force => true
  end
end

task :link_private do 
  Dir.chdir home_dir
  config["private_files"].each do |file|
    if File.exists?("#{private_dir}/#{file}")
      file_name = ".#{file}"
      puts "Creating symlink to #{file_name} in home directory."
      FileUtils.symlink "#{dotfiles_dir}/#{file}", ".#{file}", :force => true
    end
  end
end

task :install_vim_plugins do
  dotfiles_bundle_dir = "#{dotfiles_dir}/#{vim_bundle_dir}"
  FileUtils.remove_dir(dotfiles_bundle_dir, :force => true)
  Dir.mkdir(dotfiles_bundle_dir)
  Dir.chdir home_dir

  config["plugins"].each_pair do |name, repo|
    vim_plugin_dir = "#{dotfiles_bundle_dir}/#{name}"
    puts "Installing vim plugin: #{name}" 
    Open3.popen3("git clone #{repo} #{vim_plugin_dir}")
  end
end

desc "Update existing vim plugins"
task :update_vim_plugins do
  config["plugins"].each_pair do |name, repo|
    Dir.chdir "#{vim_bundle_dir}/#{name}"
    puts "Updating #{repo}" 
    `git pull`
  end
end

desc "Installs dotfiles"
task :install => [:backup, :install_vim_plugins, :link_public, :link_private]
