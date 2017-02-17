class TestJob < ApplicationJob

  queue_as :default

  @@job_mutex = Mutex.new

  def perform
    puts 'Obtaining lock'
    @@job_mutex.synchronize do
      puts 'Obtained lock'
      pens = Pen.count
      puts 'Sleeping for 5 seconds'
      sleep(5)
      puts 'Awake'
    end
    puts 'Released lock'
  end
end
