# Pizza Man Redux

Pizza Man is my go to framework for spinning up fun things. At some point I may start learning Rails but I have been doing this for so long now that I don't know how to go back.

## Installation

## Migrations
Create a file in `/app/db/migrations`. I use date-time plus a logical name e.g. `202012031132_create_temp_links.rb`

A sample file looks like:

```
Sequel.migration do
  change do
    create_table(:temp_links) do
      primary_key :id
      Integer     :feedbin_id
      Integer     :feedbin_feed_id
      String   		:title
      String   		:author
      Text   		  :summary
      Text   		  :content
      String   		:url
      String   		:extracted_content_url
      DateTime		:published
      DateTime		:created_at
      DateTime		:date_added
    end
  end
end
```

To run migrations on development use `sequel -m app/db/migrations postgres://localhost/development_alt_all_in`.

For production use (on Heroku) `heroku run sequel -m app/db/migrations 'postgres://<database name>' -a <heroku app name>`.

Note that the Heroku database endpoint can change when the database is updated or migrated. Got stuck badly on this one. Need to get this from the Heroku ENV variables.

## Models
A sample file looks like:

```
class TempLink < Sequel::Model(:temp_links)

end
```

## Library
Because I am trying to make my code cleaner, library files are essentially classes, well not really, just a bunch of functions.

Utils module is part of the base framework and also an example.

## Workers
This framework uses `sidekiq` for background jobs.

A sample worker file looks like:

```
class PushEntry
  include Sidekiq::Worker
  sidekiq_options queue: :entry

  def perform(feed_id)
		Entry.insert_temp_links(feed_id)
    puts "Insering links for feed_id #{feed_id}."
	end
end

```

## Including Files
Ensure that you include any Model, Library and Worker files in the configure statement in `app.rb`:

```
configure do
  # Database models.
  # require "./app/db/models/***"

  # Modules.
  # require "./app/lib/***"

  # Workers.
  # require "./app/lib/workers/***"
end
```

## MIT LICENSE

Copyright (c) 2013-2022 Arturo Escartin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
