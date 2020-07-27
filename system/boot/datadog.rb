Container.boot(:datadog) do |container|
  init do
    Datadog.configure do |c|
      c.use :rack, application: 'outpayment-onix'
    end
  end
end
