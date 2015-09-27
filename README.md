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
gem "spartacus", "~> 0.0.7"
```

## Usage

Create a new `Spartacus` client using your Bloc API JSON Web Tokens
```ruby
sc = Spartacus.new(ENV['API_JWT'])
```

Then use the client to make requests:

```ruby
sc.update_checkpoint(129, {name: "New Checkpint Name"})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Acknowledgements

This gem is inspired by [octokit](https://github.com/octokit)
