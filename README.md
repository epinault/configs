## Emmanuel Pinault's (@epinault) dotfiles

A set of dotfiles that I try to maintain based on need and what I have found from other github
users sharing their dotfiles or screencast/blogs. I did not keep track of who to credit but I will not get 
any credits for the structure or the content of the files beside the link.sh

### Credits
Credit for the basic organization of these files goes to [Zach
Holman](https://github.com/holman) and [Chris Kelly](https://github.com/amateurhuman) for starting me into the right direction

### Symlinks

Everything with a .symlink file extension ends up as a dotfile symlink in my $HOME
directory (usually with the same name proceeded with a dot), for example
rspec.symlink will be symlinked to $HOME/.rspec. 

I have a small script called link.sh that helps me creating the link on a per tool basis.

