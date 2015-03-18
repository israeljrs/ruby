require_relative "boot"

transaction = PagSeguro::Transaction.find_by_notification_code("739D69-79C052C05280-55542D9FBB33-4AB2D0")

puts "=> Transaction"
puts "  code: #{transaction.code}"
puts "  type: #{transaction.type_id}"
puts "  status: #{transaction.status.status}"
puts "  cancellation source: #{transaction.cancellation_source}"
puts "  escrow end date: #{transaction.escrow_end_date}"
puts "  payment method type: #{transaction.payment_method.type}"
puts "  gross amount: #{transaction.gross_amount}"
puts "  discount amount: #{transaction.discount_amount}"
puts "  operational fee amount: #{transaction.creditor_fees.operational_fee_amount}"
puts "  installment fee amount: #{transaction.creditor_fees.installment_fee_amount}"
puts "  intermediation rate amount: #{transaction.creditor_fees.intermediation_rate_amount}"
puts "  intermediation fee amount: #{transaction.creditor_fees.intermediation_fee_amount}"
puts "  commission fee amount: #{transaction.creditor_fees.commission_fee_amount}"
puts "  commission fee amount: #{transaction.creditor_fees.commission_fee_amount}"
puts "  efrete: #{transaction.creditor_fees.efrete}"
puts "  net amount: #{transaction.net_amount}"
puts "  extra amount: #{transaction.extra_amount}"

puts "    => Payments"
puts "      installment count: #{transaction.installments}"
transaction.payment_releases.each do |release|
  puts "    current installment: #{release.installment}"
  puts "    total amount: #{release.total_amount}"
  puts "    release amount: #{release.release_amount}"
  puts "    release amount: #{release.release_amount}"
  puts "    status: #{release.status}"
  puts "    release date: #{release.release_date}"
end

puts "    => Items"
puts "      items count: #{transaction.items.size}"
transaction.items.each do |item|
  puts "      item id: #{item.id}"
  puts "      description: #{item.description}"
  puts "      quantity: #{item.quantity}"
  puts "      amount: #{item.amount}"
  puts "      amount: #{item.amount}"
  puts "      weight: #{item.weight}g"
end

puts "    => Sender"
puts "      name: #{transaction.sender.name}"
puts "      email: #{transaction.sender.email}"
puts "      phone: (#{transaction.sender.phone.area_code}) #{transaction.sender.phone.number}"

puts "      => Documents"
transaction.sender.documents.each do |document|
  puts "        type: #{document.type}"
  puts "        value: #{document.value}"
end

puts "    => Shipping"
puts "      street: #{transaction.shipping.address.street}, #{transaction.shipping.address.number}"
puts "      complement: #{transaction.shipping.address.complement}"
puts "      postal code: #{transaction.shipping.address.postal_code}"
puts "      district: #{transaction.shipping.address.district}"
puts "      city: #{transaction.shipping.address.city}"
puts "      state: #{transaction.shipping.address.state}"
puts "      country: #{transaction.shipping.address.country}"
puts "      type: #{transaction.shipping.type_name}"
puts "      cost: #{transaction.shipping.cost}"
