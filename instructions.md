The Events API is a URL endpoint that can parse URL encoded query parameters.
We don't have any authentication around it, so you don't have to worry about any of that.
The URL endpoint lives at [http://swoop.startupweekend.org/events](http://swoop.startupweekend.org/events)

Here are some of the query parameters it understands:
- since: Queries for a Startup Weekend event with a start date greater than the supplied value. Date format is "YYYY-MM-DD"
- until: Queries for a Startup Weekend event with a start date less than the supplied value. Date format is the same as above
Note: "since" and "until" can be combined to describe a date range for events
- city
- state
- country
- event_status: Possible values are
  * "G" - Good
  * "W" - Working
  * "T" - Tentative
  * "P" - Prospective
  * These values cannot be combined…yet
- region: Possible values are
  * USA West
  * USA East
  * Europe
  * East Europe
  * East Asia
  * Canada
  * Western Asia
  * Southeast Asia
  * Latin America
  * Scandinavia
  * Africa
  * Southern Asia
  * Australasia
  * Middle East
  * MENA
  * Mexico/México
  * SF Bay Area
- vertical - Possible values are
  * EDU
  * NEXT
  * Video Games
  * Sustainability
  * UNI
  * Women
  * Health
  * Finance
  * Hardware
  * Maker
  * Mobile
For example, to find all 2012 events in Seattle in the EDU vertical, you could do the following:

`curl http://swoop.startupweekend.org/events?city=seattle&vertical=edu&since=2012-01-01&until=2012-12-31`

The API returns an array of 0 to many Event objects in JSON format. Here is a breakout of the data you'll be getting back:

    {
      id:Int - An integer event ID,
      event_status:String - The event status,
      city:String - The event city name,
      state:String - The event state,
      start_date:ISO Date - The event start date,
      financial_status:String - For internal use. Reflects whether finances are completed for the event,
      facilitators:Array - An array of embedded facilitator profile objects. Could look like [
        {
          _id:BSON Id - The person's profile ID,
          email:String - The facilitator's email,
          full_name:String - The concatenated first and last name,
          first_name:String,
          last_name:String
        }
      ],
      website:String - The city-level page for the event,
      main_point_of_contact:String - The first person to talk to for external queries regarding the event,
      location:Object - The lat/lng coordinates for the event: {
        lat:Decimal,
        lng:Decimal
      },
      twitter_hashtag:String - The Twitter hashtag the event uses to promote itself,
      organizers:Array - Like the facilitators field,
      manager:String - The email of the Startup Weekend operations manager supervising the event,
      showDistance:boolean - Disregard. We use this field internally for mapping functionality
    }

Again, I'm looking for creativity but this is your chance to show me your execution and how you think about approaching code.
Things like READMEs and documentation to help me evaluate your project go a long way into showing me how you'd write code for a team.
At Startup Weekend, you'd also be responsible for getting your user-base (our employees) excited about how you're going to solve their problems and how they will use your software; consider that in your submission.

That should be all you need! Let me know if you have questions.

