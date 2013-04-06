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
vimrc_file = "vimrc"
autoload_plugin_path = "#{dotfiles_dir}/vim/autoload"

# pairing variables
normal_vimrc_file = "#{vimrc_file}.normal"
normal_config = ".normal_config"
pair_vimrc_file = "#{vimrc_file}.pair"
pairing_config = ".pairing_config"

task :clean do
  FileUtils.rm(normal_config) if File.exists?(normal_config)
  FileUtils.rm(pairing_config) if File.exists?(pairing_config)
  FileUtils.rm(vimrc_file) if File.exists?(vimrc_file)
  FileUtils.rm_rf(autoload_plugin_path)
end

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
      FileUtils.symlink "#{private_dir}/#{file}", file_name, :force => true
    end
  end
end

desc "Install vim plugins"
task :install_vim_plugins do
  dotfiles_bundle_dir = "#{dotfiles_dir}/#{vim_bundle_dir}"

  puts "Deleting existing vim plugins"
  FileUtils.remove_dir(dotfiles_bundle_dir, :force => true)
  Dir.mkdir(dotfiles_bundle_dir)
  Dir.chdir home_dir

  config["plugins"].each_pair do |name, repo|
    vim_plugin_dir = "#{dotfiles_bundle_dir}/#{name}"
    Open3.popen3("git clone #{repo} #{vim_plugin_dir}") do |stdin, stdout, stderr, wait_thr|
      puts "Installed vim plugin: #{name}" if wait_thr.value == 0
      puts "Failed to install vim plugin: #{name}" if wait_thr.value != 0
    end
  end

  # Move pathogen
  FileUtils.mkdir(autoload_plugin_path)
  FileUtils.cp("#{dotfiles_bundle_dir}/autoload/pathogen.vim", "#{autoload_plugin_path}/pathogen.vim")
end

desc "Update existing vim plugins"
task :update_vim_plugins do
  config["plugins"].each_pair do |name, repo|
    Dir.chdir "#{dotfiles_dir}/#{vim_bundle_dir}/#{name}"
    puts "Updating #{repo}"
    `git pull`
  end
end

desc "Switch to pairing configuration"
task :pair do
  Dir.chdir dotfiles_dir
  FileUtils.rm("vimrc", :force => true)

  if File.exists?(normal_config)
    puts "Switching to pairing config"
    FileUtils.touch(pairing_config)
    FileUtils.rm(normal_config) if File.exists?(normal_config)
    FileUtils.cp(pair_vimrc_file, "#{vimrc_file}")
  else
    puts "Switching to normal config"
    FileUtils.touch(normal_config)
    FileUtils.rm(pairing_config) if File.exists?(pairing_config)
    FileUtils.cp(normal_vimrc_file, "#{vimrc_file}")
  end
end

desc "Installs dotfiles"
task :install => [:clean, :backup, :install_vim_plugins, :link_public, :link_private, :pair]
