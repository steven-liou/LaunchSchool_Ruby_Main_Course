let invoices = {
  unpaid: [],
  paid: [],
  add(name, amount) {
    let transaction = {
      name,
      amount,
    };
    this.unpaid.push(transaction);
  },
  totalDue() {
    return this.total(this.unpaid);
  },
  totalPaid() {
    return this.total(this.paid);
  },
  total(list) {
    return list.reduce((total, transaction) => total + transaction.amount, 0);
  },
  payInvoice(name) {
    let unpaidArray = [];
    this.unpaid.forEach((transaction) => {
      if (transaction.name === name) {
        this.paid.push(transaction);
      } else {
        unpaidArray.push(transaction);
      }
    });
    this.unpaid = unpaidArray;
  },
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.5);
invoices.add('Slough Digital', 300);

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
console.log(invoices.totalPaid());
console.log(invoices.totalDue());
