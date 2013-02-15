#!/usr/bin/env rake
require 'fileutils'

task :default => :install

home_dir = Dir.home
dotfiles_dir = "#{home_dir}/dotfiles"                    # dotfiles directory
private_dir = "#{home_dir}/dotfiles_private"    # dotfiles private directory
backup_dir = "#{home_dir}/dotfiles_bak"         # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
files = %w{ zshrc }    # list of files/folders to symlink in homedir
private_files = %w{ zshrc.private }

task :backup => [:setup] do
  puts "Creating #{backup_dir} for backup of any existing dotfiles in #{home_dir} ..."
  Dir.mkdir(backup_dir) unless File.exists?(backup_dir)

  puts "Moving any existing dotfiles from #{home_dir} to #{backup_dir}"
  Dir.chdir home_dir
  files.each do |file|
    file_name = ".#{file}"
    FileUtils.mv(file_name, "backup_dir/#{file_name}", :force => true) if File.exists?(file_name)
  end
end

task :link_public do 
  Dir.chdir home_dir
  files.each do |file|
    file_name = ".#{file}"
    puts "Creating symlink to #{file_name} in home directory."
    FileUtils.symlink "#{dotfiles_dir}/#{file}", ".#{file}", :force => true
  end
end

task :link_private do 
  Dir.chdir home_dir
  private_files.each do |file|
    if File.exists?("#{private_dir}/#{file}")
      file_name = ".#{file}"
      puts "Creating symlink to #{file_name} in home directory."
      FileUtils.symlink "#{dotfiles_dir}/#{file}", ".#{file}", :force => true
    end
  end
end

task :install => [:backup, :link_public, :link_private]
