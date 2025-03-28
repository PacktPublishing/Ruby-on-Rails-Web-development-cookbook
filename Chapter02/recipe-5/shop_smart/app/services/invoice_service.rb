class InvoiceService
  def self.generate(order)
    # In a real application, this would generate a PDF invoice
    # and store it somewhere (e.g., S3, local storage)
    Rails.logger.info "Generating invoice for order #{order.id}"
  end
end 