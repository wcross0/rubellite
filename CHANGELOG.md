# Changelog


### 0.2.8
*Timer.new*
- Added Integer#reverse
- Added Integer#sep
- Added Float#sep
- Added timer.rb
- Added the for-fun fight.rb and fiddled with the for-fun character.rb
- Removed nil_class.rb
- Fixed a redundancy in Float#sep

### 0.2.7
*Method Acting*
- Added Array#split
- Updated Object#presence to match Rails
- Updated String#squish and String#squish! to match Rails
- Added Object#in?
- Updated String#reverse_words to be a little more robust

### 0.2.6
*Aliases*
- Renamed Symbol#call to Symbol#with
- Added Symbol#call as an alias for Symbol#with
- Added Array#gcd
- Added String#- as a shorthand for `"some string".gsub("str", "")`
- Added String#/ as an alias for String#split
- Added Array#* as an alias for Array#join when the argument is a string

### 0.2.5
*Fiddling*
- Fiddled around with the Character class
- Added Array#except and Array#except!

### 0.2.4
*Prime Time*
- Added prime.rb
- Added Prime#factorization
- Cleaned up some blank?/present? stragglers, including deleting false_class.rb


### 0.2.3
*Bundleable*
- Fixed a conflict preventing bundle install
- Updated blank? and present? to be using the correct logic
- Removed Hash#wb
- Added Hash#grid for funzies
- Added \*.lock and \*.gem to .gitignore
- Changed BasicObject methods to Object methods
- Added Object#presence

### 0.2.2
*Overdue Cleanup*
- Created changelog.md
- Removed blank? and present? for Enumerator, FalseClass, Float, Integer, Symbol, and TrueClass as they are covered by the methods in BasicObject
- Deleted false_class.rb as it was now blank
- Deleted true_class.rb as it was now blank
- Added Array#mode

### 0.2.1
*Organizational Update*

- Removed "check" method from all classes
- Moved Fixnum methods to Integer class
- Removed Fixnum.rb
- Updated Integer#digits to function more like the real one
- Removed String#wb