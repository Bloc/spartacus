#Spartacus

Ruby toolkit for the Bloc API.

![Spartacus](http://bloc-global-assets.s3.amazonaws.com/spartacus.png)

##Quick start

Install via Rubygems

```bash
gem install spartacus
```

... or add to your Gemfile

```ruby
gem "spartacus", "~> 0.2.7"
```

## Usage

Create a new `Spartacus` client using your Bloc username and password:

```ruby
sc = Spartacus.new("ben@bloc.io", "gooderpassword")
```

Then use the client to make requests:

```ruby
sc.update_checkpoint(129, {name: "New Checkpoint Name"})
```

## Documentation

All the documentation lives [here](http://www.rubydoc.info/github/bmneely/spartacus/).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Acknowledgements

This gem is inspired by [octokit](https://github.com/octokit)
