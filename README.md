# Sidekiq-Mutex Deadlock Demo

This app is to demonstrate deadlock within Sidekiq anytime ActiveRecord is called within a mutex lock and another job hits the mutex lock at the same time.

## Instructions

1. Run `bundle install`
2. Run `rails db:migrate`
3. Open the rails console and run `TestJob.perform_later` twice
4. Run `sidekiq` in a terminal

After running Sidekiq, the jobs will lock up as soon as one job hits an ActiveRecord call.  View the job's code at `app/jobs/test_job.rb` for more information.

## Notes

* The type of mutex doesn't seem to matter.  Using the `redis-mutex` or `redis-semaphore` gems both seem to achieve the same deadlocked outcome.
* ActiveRecord must be used to achieve deadlock.  Running a raw SQL query doesn't seem to result in deadlock.
