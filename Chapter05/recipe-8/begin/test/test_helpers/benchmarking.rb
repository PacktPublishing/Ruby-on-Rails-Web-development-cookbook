# frozen_string_literal: true

module Benchmarking
  def bench_request(runs: 7, warmup: 1)
    warmup.times { yield }

    times = Array.new(runs) do
      GC.start
      start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      yield
      Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time
    end

    {
      runs: runs,
      median: median(times),
      p95: percentile(times, 95),
      min: times.min,
      max: times.max,
      samples: times
    }
  end

  private

  def median(array)
    sorted = array.sort
    mid = sorted.size / 2

    sorted.size.odd? ? sorted[mid] : (sorted[mid - 1] + sorted[mid]) / 2.0
  end

  def percentile(array, percentage)
    sorted = array.sort
    index = ((percentage / 100.0) * (sorted.size - 1)).round
    sorted[index]
  end
end
